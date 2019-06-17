//
//  Model.swift
//  TourMan 1.0.0
//
//  Created by Aleh Ban on 6/7/19.
//  Copyright © 2019 Aleh Ban. All rights reserved.
//

import UIKit

var pathForSaveData: String {
    let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true) [0] + "/data.plist"
    return path
}

var rootItem: ToDoItem?


func loadData() {
    if let dict = NSDictionary (contentsOfFile: pathForSaveData) {
        rootItem = ToDoItem(dictionary: dict)
    } else {
        rootItem = ToDoItem(name: "ToDo")
    }
}
    
func saveData() {
    rootItem?.dictionary.write(toFile: pathForSaveData, atomically: true)
}




