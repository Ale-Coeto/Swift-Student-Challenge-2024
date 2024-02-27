//
//  SwiftUIView.swift
//  
//
//  Created by Alejandra Coeto on 15/02/24.
//

import SwiftUI

struct CustomBlock: View {
    let title: String
    let description: String
    let icon: String
    let color: Color
    let image: String
    
    @State var popup: Bool = false
    
    var body: some View {
        Button {
            popup = true
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 9.0)
                    .foregroundColor(color)
                            
                HStack {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(9.0)
                        .shadow(radius: 3)
                        
                    Spacer()
                    
                    VStack(spacing: 10) {
                        
                        Spacer()
                        
                        Text(title)
                            .foregroundColor(.white)
                            .bold()
                            
                        
                        Image(systemName: icon)
                            .foregroundColor(.white)
                            
                        
                        Spacer()
                    }
                    
                    Spacer()

                }
                .popover(isPresented: $popup, arrowEdge: .bottom) {
                    HStack {
                        Image(image)
                            .resizable()
                            .scaledToFill()
                        
                        VStack {
                            Text(title)
                                .bold()
                            
                            
                            Text(description)
                        }
                    }
                    .padding()
                    .foregroundColor(Color("Text"))
                    .frame(width: 350)
                    
                }
            }
        }
        .padding(.vertical, 5)
        .padding(.horizontal)
        
    }

}

#Preview {
    CustomBlock(title: "Tips", description: "description", icon: "house", color: .green, image: "Mountains")
}
