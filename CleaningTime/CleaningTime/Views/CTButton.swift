//
//  CTButton.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 22/07/2023.
//

import SwiftUI

struct CTButton: View {
    let title: String
    let background: Color
    let action: ()-> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        .padding()
    }
}

struct CTButton_Previews: PreviewProvider {
    static var previews: some View {
        CTButton(title: "Title", background: .red){
            
        }
    }
}
