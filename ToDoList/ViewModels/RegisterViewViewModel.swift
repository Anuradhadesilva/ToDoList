//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Anuradha Desilva on 17/01/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init(){}
    
    func register(){
        guard validate() else{
            return 
        }
        
        Auth.auth().createUser(withEmail: email, password: password){ [weak self] result,error in
            guard let userId = result?.user.uid else{
                print("Error creating user:\(String(describing: error?.localizedDescription))")
                return
            }
            self?.insertUserRecord(id: userId)
            print("User created successfully. Email: \(self?.email ?? "N/A")")
        }
    }
    private func insertUserRecord(id:String){
        let newUser = User(
            id: id,
            name: name,
            email: email,
            joined: Date.timeIntervalSinceReferenceDate
        )
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
       
    }
    
    private func validate() -> Bool{
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            return false
        }
        guard password.count>=6 else{
            return false
        }
        return true
    }
}
