//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Anuradha Desilva on 17/01/2024.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    init(){
        self.handler = Auth.auth().addStateDidChangeListener {[weak self]_, user in
            
                self?.currentUserId = user?.uid ?? ""
            
            
        }
    }
    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
}
