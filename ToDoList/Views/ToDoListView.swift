//
//  LoDoListView.swift
//  ToDoList
//
//  Created by Anuradha Desilva on 17/01/2024.
//

import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel = ToDoListViewModel()
    private let userId:String
    
    init(userId:String){
        self.userId=userId
    }
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button{
                    viewModel.showingNewItemView = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView()
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}
