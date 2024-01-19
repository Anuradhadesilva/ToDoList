//
//  loginViewViewModel.swift
//  ToDoList
//
//  Created by Anuradha Desilva on 17/01/2024.
//

import FirebaseAuth
import Foundation
class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
    }
    func login(){
        guard validate() else{
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
        errorMessage = "please fill all field"
            return false
        }
        
        guard !email.contains("@") && email.contains(".")
        else{
            errorMessage = "please enter valid email "
            return false
        }
        return true    }
    
}
