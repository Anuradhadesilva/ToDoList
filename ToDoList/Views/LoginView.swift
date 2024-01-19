//
//  LoginView.swift
//  ToDoList
//
//  Created by Anuradha Desilva on 17/01/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                HeaderView(title: "To Do List", subTitle: "Get things done", angle: 15, background: .red)
               
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundStyle(Color.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    TLButton(title: "Login", background: .white)
                    {
                        viewModel.login()
                    }
                    .padding()
                    
                }
                VStack{
                    Text("new User Here?")
                    NavigationLink("Create an account",destination:RegisterView())
                }
                .padding(.bottom,50)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
