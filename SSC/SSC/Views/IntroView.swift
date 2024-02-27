//
//  SwiftUIView.swift
//  
//
//  Created by Alejandra Coeto on 15/02/24.
//

import SwiftUI

struct IntroView: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass
    @Binding var landing: Bool
    
    var body: some View {
        VStack {
            
            Spacer()
            
            ScrollView {
                VStack (alignment: .leading) {
                    
                    // Memoji
                    ZStack {
                        RoundedRectangle(cornerRadius: .greatestFiniteMagnitude)
                            .foregroundColor(Color("Highlights").opacity(0.7))
                        
                        Image("Memoji")
                            .resizable()
                    }
                    .frame(width: 170, height: 170)
                    
                    
                    Text("Hi, \n I'm Alejandra Coeto. I'm a Computer Science and Technology student. I like to learn about new technologies, face new challenges and share my passion for programming and robotics with the rest of the community.\n \n My favorite hobby is climbing, as it is a very complete sport that I would like for more people to know about and try. Hence, this app introduces new climbers to the sport, promoting an inclusive environment and providing tips. The main features are: ")
                        .padding(.vertical, 35)
                    
                    FeatureView(description: "AR view of different types of holds", icon: "cube", color: .orange)
                    
                    FeatureView(description: "Log book to monitor progress over time, seen through charts", icon: "chart.line.uptrend.xyaxis", color: .green)
                }
     
                .padding(.horizontal, sizeClass == .compact ? 30 : 180)
                .padding(.vertical, 20)
                
            }
            .ignoresSafeArea()
            .padding()
            .foregroundColor(Color("Subtext"))
            .font(.system(size: 20))
            
            Spacer()
            
            CustomBtn(text: "Next", btn: true) {
                landing = false
            }
            .frame(width: 150, height: 20)
            .padding(.bottom)
            Spacer()
            
        }
        .frame(maxHeight: .infinity)
        .background(Color("Background"))
            
    }
}



#Preview {
    IntroView(landing:Binding(get: {
        return true
    }, set: {
        _ in
    }))
    
}
