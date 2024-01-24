//
//  ProfileView.swift
//  ToDoList
//
//  Created by Anuradha Desilva on 17/01/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
               
                    Text("Profile")
                        .font(.title.bold())
                    Image(systemName: "person.circle")
                         .resizable()
                         .frame(width: 100,height: 100)
                         .padding(.bottom,40)
                     VStack(alignment:.leading){
                         List{
                             HStack{
                                 Text("Name:")
                                     .bold()
                                 Text(user.name)
                             }
                             HStack{
                                 Text("Email:")
                                     .bold()
                                 Text(user.email)
                             }
                             HStack{
                                 Text("Member Since:")
                                     .bold()
                                 Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                             }
                         }
                         .frame(width: 400,height: 220)
                         .cornerRadius(8)
                       
                     }
                     Button("Log Out"){
                         viewModel.logOut()
                     }
                     .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 40)
                     .background(Color.blue)
                     .foregroundColor(.white)
                     .font(.title3.bold())
                     .cornerRadius(5)
                     .tint(.red)
                     .padding()
                     Spacer()
                    
                } else{
                    Text("Loading profile......")
                }
               
            }
            
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
