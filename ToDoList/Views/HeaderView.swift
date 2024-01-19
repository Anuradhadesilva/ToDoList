//
//  HeaderView.swift
//  ToDoList
//
//  Created by Anuradha Desilva on 18/01/2024.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(background)
                    .rotationEffect(Angle(degrees: angle ))
                VStack{
                    Text(title)
                        .foregroundStyle(Color.white)
                        .bold()
                        .font(.system(size: 50))
                    Text(subTitle)
                        .font(.system(size: 30))
                        .foregroundStyle(Color.white)
                }
                .padding(.top,50)
            }
            .frame(width: UIScreen.main.bounds.width*3,
                   height: 350)
            .offset(y:-150)
             Spacer()
        }
    }
}

#Preview {
    HeaderView(title: "To Do List", subTitle: "Get things done", angle: 15, background: .red)
}
