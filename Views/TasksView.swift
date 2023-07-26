//
//  TasksView.swift
//  ToDo
//
//  Created by Luiz Eduardo Barros Coelho on 26/07/23.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var showRequestsView: Bool = false
    
    var body: some View {
        VStack {
            HStack(){
                Text("Minhas tarefas").font(.title3).bold().padding().frame(maxWidth: .infinity, alignment: .leading)
                
                ToRequestViewButton().padding().onTapGesture {
                    showRequestsView.toggle()
                }
            }
            
            if(realmManager.tasks.isEmpty) {
                Text("Nenhuma tarefa cadastrada").padding()
            }
            List {
                ForEach(realmManager.tasks, id: \.id) {
                    task in
                    if !task.isInvalidated {
                        TaskRow(task: task.title, completed: task.completed)
                            .onTapGesture {
                                realmManager.updateTask(id: task.id, completed: !task.completed)
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    realmManager.deleteTask(id: task.id)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
        }
        .sheet(isPresented: $showRequestsView) {
            RequestView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.120, saturation: 0.141, brightness: 0.972))
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
