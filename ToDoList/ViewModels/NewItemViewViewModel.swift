//
//  NewitemListViewViewModel.swift
//  ToDoList
//
//  Created by Anuradha Desilva on 17/01/2024.
//

import Foundation

class NewItemViewViewModel: ObservableObject{
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var alertShow = false
    init(){

    }
    func save(){
        
    }
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-89400) else{
            return false
        }
        return true
    }
}

