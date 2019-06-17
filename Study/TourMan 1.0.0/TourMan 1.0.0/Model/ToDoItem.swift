//
//  ToDoItem.swift
//  TourMan 1.0.0
//
//  Created by Aleh Ban on 6/7/19.
//  Copyright © 2019 Aleh Ban. All rights reserved.
//

import UIKit

class ToDoItem {
    
    var name: String
    var isComplete: Bool
    
    var subItems: [ToDoItem]
    
    init(name: String) {
        self.name = name
        self.isComplete = false
        
        self.subItems = []
        
    }
    
    init(dictionary: NSDictionary) {
        self.name = dictionary.object(forKey: "name") as! String
        self.isComplete = dictionary.object(forKey: "isComplete") as! Bool
        self.subItems = []
        
        let arraySubTodos = dictionary.object(forKey: "subtodos") as! NSArray
        for subtodoDict in arraySubTodos {
            self.subItems.append(ToDoItem(dictionary: subtodoDict as! NSDictionary))
        }
    }
    
    var dictionary: NSDictionary {
        var arraySubToDos = NSArray()
        for subitem in subItems {
            arraySubToDos = arraySubToDos.adding(subitem.dictionary) as NSArray
        }
        
        let dictionary = NSDictionary(objects: [name, isComplete, arraySubToDos], forKeys: ["name" as NSCopying,"isComplete" as NSCopying,"subtodos" as NSCopying])
        
        return dictionary
    }

    func addSubItem(subItem: ToDoItem) {
        
        subItems.append(subItem)
    }
    
    func removeSubItem (index: Int) {
        subItems.remove(at: index)
    }
}
