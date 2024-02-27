//
//  WhatIsClimbingView.swift
//  SwiftStudentChallenge2024
//
//  Created by Alejandra Coeto on 17/02/24.
//

import SwiftUI

struct WhatIsClimbingView: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("Block"))
            
            VStack(alignment: .leading) {
                CustomTitle(title: "What is climbing", number: "1")
                    .padding(.bottom)
                
                Text("Climbing is an activity that involves ascending natural rock formations or indoor climbing walls.\n ")
                    .foregroundColor(Color("Subtext"))
                
                Text("Types of climbing")
                    .bold()
                    .foregroundColor(Color("Text"))
                    
                Text("There are many types of climbing, both indoors and outdoors, with or without ropes. However, this app focuses on indoor Bouldering, as bouldering gyms are more common.\n")
                    .foregroundColor(Color("Subtext"))
                
                
                HStack {
                    CustomBlock(title: "Bouldering", description: "Bouldering is done on 3 meter walls without rope. It is more about strength and problem solving.", icon: "gear.circle", color: .blue, image: "Bouldering")
                    
                    CustomBlock(title: "Top-rope", description: "In this style, the rope is already setup for the climber.", icon: "arrow.up.square.fill", color: .green, image: "TopRope")
                    
                    CustomBlock(title: "Lead", description: "In lead, the climber needs to secure the rope as they go up. It is necessary to learn the technique before trying it.", icon: "lock.circle", color: .orange, image: "Lead")
                    
                    CustomBlock(title: "Speed", description: "This focuses on going up as fast as possible on a standard route. It uses an auto-belaying system.", icon: "forward.fill", color: .teal, image: "Speed")

                }
                
                    

            }.padding()
            .padding()
        }

    }
}

#Preview {
    WhatIsClimbingView()
}
