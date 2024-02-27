//
//  SwiftUIView 2.swift
//  
//
//  Created by Alejandra Coeto on 15/02/24.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    let spacing = 5
    
    var body: some View {
        NavigationStack {
            
            if sizeClass == .compact {
                ScrollView {
                    VStack (spacing: 20) {
                        
                        WhatIsClimbingView()
                    
                        TipsView()
                        
                        HoldsView()
                        
                    }
                    
                    
                }
                .navigationTitle("Home")
                .padding(.all, 20)
                .background(Color("Background"))
                
            } else {
                VStack (spacing: 30) {
                    
                    WhatIsClimbingView()
                    
                    HStack (spacing: 20) {
                        TipsView()
                        
                        HoldsView()
                        
                    }
                    
                }
                .navigationTitle("Home")
                .padding(.all, 15)
                .background(Color("Background"))
            }
            
        }
        
    }
}

#Preview {
    HomeView()
}


