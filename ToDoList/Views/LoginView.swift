//
//  LoginView.swift
//  ToDoList
//
//  Created by Anuradha Desilva on 17/01/2024.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationView{
            VStack{
                HeaderView(title: "To Do List", subTitle: "Get things done", angle: 15, background: .red)
                Form{
                    TextField("Email Address", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button{
                        
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                            Text("Login")
                                .foregroundStyle(Color.white)
                                .bold()
                        }
                    }
                    
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
