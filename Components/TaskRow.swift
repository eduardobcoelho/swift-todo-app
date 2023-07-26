//
//  TaskRow.swift
//  ToDo
//
//  Created by Luiz Eduardo Barros Coelho on 26/07/23.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var completed: Bool
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: completed ? "checkmark.circle" : "circle")
            
            Text(task)
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Finalizar projeto DDM", completed: true)
    }
}
