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
                    Image(systemName: "person.circle")
                         .resizable()
                         .frame(width: 100,height: 100)
                         .padding()
                     VStack(alignment:.leading){
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
                             Text("Member Since")
                                 .bold()
                             Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                         }
                     }
                     Button("Log Out"){
                         viewModel.logOut()
                     }
                     .tint(.red)
                     .padding()
                     Spacer()
                } else{
                    Text("Loading profile......")
                }
               
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
