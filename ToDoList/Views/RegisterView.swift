//
//  RegisterView.swift
//  ToDoList
//
//  Created by Anuradha Desilva on 17/01/2024.
//

import SwiftUI

struct RegisterView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    var body: some View {
        HeaderView(title: "Register", subTitle: "Start organizing todos", angle:-15, background: .orange)
        Form{
            TextField("Full Name", text: $name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled()
            TextField("Email Address", text: $email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled()
            TextField("Password", text: $password)
                .textFieldStyle(DefaultTextFieldStyle())
            TLButton(title: "Register", background: .white){
                
            }
            .padding()
        }
    }
}

#Preview {
    RegisterView()
}
