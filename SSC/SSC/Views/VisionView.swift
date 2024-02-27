//
//  SwiftUIView.swift
//  
//
//  Created by Alejandra Coeto on 25/02/24.
//

import SwiftUI

struct VisionView: View {
    @State var isDragging = false
    @State var position = CGSize.zero
    @State var width: CGFloat = 30
    @State var height: CGFloat = 30
    
    var body: some View {
        VStack {
            
            
            Text("Change the size of the rectangle and drag it over the starting hold")
            
            //Controllers
            HStack (spacing: 30) {
                //Width controller
                VStack {
                    Text("Width")
                    HStack {
                        Button {
                            if width >= 5 {
                                width -= 5
                            }
                        } label: {
                            Image(systemName: "minus")
                        }
                        
                        Button {
                            if width < 200 {
                                width += 5
                            }
                        } label: {
                            Image(systemName: "plus")
                        }
                        
                    }
                }
                
                //Height controller
                VStack {
                    Text("Height")
                    HStack {
                        Button {
                            if height >= 5 {
                                height -= 5
                            }
                        } label: {
                            Image(systemName: "minus")
                        }
                        
                        Button {
                            if height < 200 {
                                height += 5
                            }
                        } label: {
                            Image(systemName: "plus")
                        }
                        
                    }
                }
            }
            
            //Image prev
            ZStack {
            Color(isDragging ? .gray : .white)
            
                
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .frame(width: width, height: height)
                .border(Color("Main"), width: 3)
                .offset(x: position.width, y: position.height)
                
                .foregroundColor(.white.opacity(0.1))

                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            position = value.translation
                            isDragging = true
                        })
                        
                        .onEnded({ value in
                            isDragging = false
                        })
            )
        }
        .edgesIgnoringSafeArea(.all)
        }
        }
        
}

#Preview {
    VisionView()
}
