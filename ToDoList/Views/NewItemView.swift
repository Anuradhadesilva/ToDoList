//
//  NewItemView.swift
//  ToDoList
//
//  Created by Anuradha Desilva on 22/01/2024.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
            Form{
                TextField("Title", text: $viewModel.titile)
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TLButton(title: "Save", background: .white){
                    viewModel.save()
                }
                .padding()
            }
        }
    }
}

#Preview {
    NewItemView()
}
