//
//  RemoteService.swift
//  ToDo
//
//  Created by Luiz Eduardo Barros Coelho on 26/07/23.
//

import Foundation

class MyURLSessionDelegate: NSObject, URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            if let serverTrust = challenge.protectionSpace.serverTrust {
                let credential = URLCredential(trust: serverTrust)
                completionHandler(.useCredential, credential)
            }
        }
    }
}

class RemoteService: ObservableObject {
    @Published private(set) var remoteTasks: [Task] = []
    
    init () {
        fetchTasks()
    }
    
    func fetchTasks() {
        let delegate = MyURLSessionDelegate()
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: delegate, delegateQueue: nil)
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!

        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Erro: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Dados não encontrados.")
                return
            }
            
            do {
                self.remoteTasks = []
                if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    for jsonObject in jsonArray {
                        if let title = jsonObject["title"] as? String,
                           let completed = jsonObject["completed"] as? Bool {
                            var reqTask = Task(value: ["title": title, "completed": completed])
                            self.remoteTasks.append(reqTask)
                        }
                    }
                }
            } catch {
                print("Erro ao processar os dados JSON: \(error.localizedDescription)")
            }
        }
       
        task.resume()
    }
}
