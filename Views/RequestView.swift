//
//  RequestView.swift
//  ToDo
//
//  Created by Luiz Eduardo Barros Coelho on 26/07/23.
//

import SwiftUI

struct RequestView: View {
    @StateObject private var remoteService = RemoteService()
    
    
    var body: some View {
        VStack {
            HStack(){
                Text("Minhas tarefas (API)").font(.title3).bold().padding().frame(maxWidth: .infinity, alignment: .leading)
            }
            
            if(remoteService.remoteTasks.isEmpty) {
                Text("Carregando...").padding()
            }
            List {
                ForEach(remoteService.remoteTasks) {
                    task in
                        TaskRow(task: task.title, completed: task.completed)
                }
            }
        }
    }
}

struct RequestView_Previews: PreviewProvider {
    static var previews: some View {
        RequestView()
    }
}
