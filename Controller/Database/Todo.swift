//
//  Todo.swift
//  FirebaseSample
//
//  Created by Viet Le on 16/08/2021.
//

import Foundation
import Firebase

class Todo {
    var id = ""
    var todo = ""
    
    init() {
        
    }
    
    init(snapShot: QueryDocumentSnapshot) {
        self.id = snapShot.reference.documentID
        self.todo = snapShot.data()["todo"] as! String
    }
}
