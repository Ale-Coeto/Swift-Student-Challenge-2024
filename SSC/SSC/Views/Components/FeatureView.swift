//
//  SwiftUIView.swift
//  
//
//  Created by Alejandra Coeto on 25/02/24.
//

import SwiftUI

struct FeatureView: View {
    let description: String
    let icon: String
    let color: Color
    
    var body: some View {
            
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding()
                    .background(color.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
                Text(description)
            }

    }
}

#Preview {
    FeatureView(description: "aa", icon: "chart.line.uptrend.xyaxis", color: .blue)
}
