//
//  SwiftUIView.swift
//  
//
//  Created by Alejandra Coeto on 17/02/24.
//

import SwiftUI

struct HoldsView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(Color("Block"))
                
                LazyVStack(alignment: .leading) {
                    CustomTitle(title: "View holds", number: "3")
                    
                    HStack {
                        Image("ARHolds")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                        
                        VStack {
                            Text("Preview the types of climbing holds and get tips on how to hold them.")
                                .padding(.horizontal)
                            
                            Spacer()
                            NavigationLink(destination: ARHoldsView()) {
                                CustomBtn(text: "View holds", btn: false) {
                                    
                                }.frame(width: 200)
                            }
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    
                    
                    
                }
                .padding()
                
            }
        }
        
    }
}

#Preview {
    HoldsView()
}
