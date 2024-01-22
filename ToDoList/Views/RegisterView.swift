//
//  RegisterView.swift
//  ToDoList
//
//  Created by Anuradha Desilva on 17/01/2024.
//

import SwiftUI

struct RegisterView: View {
   @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        HeaderView(title: "Register", subTitle: "Start organizing todos", angle:-15, background: .orange)
        Form{
            TextField("Full Name", text: $viewModel.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled()
            TextField("Email Address", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled()
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            
            TLButton(title: "Register", background: .white){
                viewModel.register()
            }
            .padding()
        }
    }
}

#Preview {
    RegisterView()
}
