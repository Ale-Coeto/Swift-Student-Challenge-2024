//
//  SwiftUIView.swift
//  
//
//  Created by Alejandra Coeto on 15/02/24.
//

import SwiftUI

struct CustomTitle: View {
    let title: String
    let number: String
    
    var body: some View {
        HStack {
        
           Text(number)
                .foregroundColor(Color("Highlights"))
                .font(.largeTitle)
                .bold()
                
        
            Text(title)
                .font(.title)
                .bold()
                .foregroundColor(Color("Text"))
            
        } .frame(alignment: .leading)
    }
}

#Preview {
    CustomTitle(title: "Test", number: "1")
}
