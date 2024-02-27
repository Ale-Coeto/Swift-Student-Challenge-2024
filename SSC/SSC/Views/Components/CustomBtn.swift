//
//  SwiftUIView.swift
//  
//
//  Created by Alejandra Coeto on 13/02/24.
//

import SwiftUI

struct CustomBtn: View {
    let text: String
    let btn: Bool
    let action: () -> Void
    
    var body: some View {
        
        if btn {
            Button() {
                action()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("Main"))
                    
                    Text(text)
                        .foregroundColor(Color.white)
                        .bold()
                        .padding()
                }
            }.padding()
        
        
        
        } else {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(Color("Main"))
                    .frame(width: 100, height: 40)
                
                Text("Next")
                    .foregroundColor(Color.white)
                    .bold()
                    
            }
        }
           
        
    }
}

#Preview {
    CustomBtn(text: "Hi btn", btn: true) {
        
    }
}
