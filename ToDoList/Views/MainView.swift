//
//  ContentView.swift
//  ToDoList
//
//  Created by Anuradha Desilva on 17/01/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty
        {
            TabView(){
                ToDoListView(userId: viewModel.currentUserId)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
            
        } else{
            LoginView()
        }
        
        
    }
}

#Preview {
    MainView()
}
