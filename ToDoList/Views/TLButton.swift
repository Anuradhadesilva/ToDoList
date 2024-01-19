//
//  TLButton.swift
//  ToDoList
//
//  Created by Anuradha Desilva on 18/01/2024.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
   
    var body: some View {
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                Text(title)
                    .foregroundStyle(background)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Value", background: .pink){
        
    }
}
