//
//  SwiftUIView.swift
//  
//
//  Created by Alejandra Coeto on 25/02/24.
//

import SwiftUI

struct AddImageView: View {
    @State var isPresenting: Bool = false
        @State var uiImage: UIImage?
        @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
        
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "photo")
                    .onTapGesture {
                        isPresenting = true
                        sourceType = .photoLibrary
                    }
                
                Image(systemName: "camera")
                    .onTapGesture {
                        isPresenting = true
                        sourceType = .camera
                    }
            }
            .font(.title)
            .foregroundColor(.blue)
            
            Rectangle()
            .strokeBorder()
            .foregroundColor(.yellow)
            .overlay(
                Group {
                    if uiImage != nil {
                        Image(uiImage: uiImage!)
                            .resizable()
                            .scaledToFit()
                    }
                }
            )
        }
    }
}

#Preview {
    AddImageView()
}
