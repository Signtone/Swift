//
//  ModelSos.swift
//  TourMan 1.0.0
//
//  Created by Aleh Ban on 6/18/19.
//  Copyright © 2019 Aleh Ban. All rights reserved.
//

import Foundation

var SosItems: [String] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoSosKey")
        UserDefaults.standard.synchronize()
    }
    get {
        if let array = UserDefaults.standard.array(forKey: "ToDoSosKey") {
            return array as! [String]
        } else {
            return []
        }
    }
}

func moveSosItem (fromIndex: Int, toIndex: Int) {
    let from = SosItems[fromIndex]
    SosItems.remove(at: fromIndex)
    SosItems.insert(from, at: toIndex)
}

func addSosItem (nameItem: String) {
    SosItems.append(nameItem)
    
}

func removeSosItem (at index: Int) {
    SosItems.remove(at: index)
    
}
