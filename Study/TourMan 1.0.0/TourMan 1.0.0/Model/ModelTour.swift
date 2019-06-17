//
//  ModelTour.swift
//  TourMan 1.0.0
//
//  Created by Aleh Ban on 6/17/19.
//  Copyright © 2019 Aleh Ban. All rights reserved.
//

import Foundation

var ToDoItems: [String] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    get {
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") {
            return array as! [String]
        } else {
         return []
        }
    }
}

func moveItem (fromIndex: Int, toIndex: Int) {
    let from = ToDoItems[fromIndex]
    ToDoItems.remove(at: fromIndex)
    ToDoItems.insert(from, at: toIndex)
}

func addItem (nameItem: String) {
    ToDoItems.append(nameItem)
   
}

func removeItem (at index: Int) {
    ToDoItems.remove(at: index)
   
}

