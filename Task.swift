//
//  Task.swift
//  ToDo
//
//  Created by Luiz Eduardo Barros Coelho on 26/07/23.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
