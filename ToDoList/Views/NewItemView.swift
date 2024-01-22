//
//  NewItemView.swift
//  ToDoList
//
//  Created by Anuradha Desilva on 22/01/2024.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
            Form{
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TLButton(title: "Save",
                         background: .white
                ){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    } else{
                        viewModel.alertShow = true
                    }
                    
                }
                .padding()
            }
            .alert(isPresented: $viewModel.alertShow) {
                Alert(title: Text("Error"), message: Text("Fill all field"))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
