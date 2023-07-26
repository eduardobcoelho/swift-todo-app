//
//  AddTaskView.swift
//  ToDo
//
//  Created by Luiz Eduardo Barros Coelho on 26/07/23.
//

import SwiftUI

struct AddTaskView: View {
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Criar nova tarefa")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Escreva sua tarefa aqui", text: $title)
                .textFieldStyle(.roundedBorder)
            
            Button {
                if title != "" {
                    realmManager.addTask(taskTitle: title)
                }
                dismiss()
            } label: {
                Text("Adicionar tarefa")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(hue: 0.328, saturation: 0.796, brightness: 0.488))
                    .cornerRadius(30)
            }
            
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(hue: 0.120, saturation: 0.141, brightness: 0.972))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
