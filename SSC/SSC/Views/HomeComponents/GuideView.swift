//
//  SwiftUIView.swift
//  
//
//  Created by Alejandra Coeto on 25/02/24.
//

import SwiftUI

struct GuideView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
    
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color("Background"))
            
            ScrollView {
                LazyVStack (alignment: .leading){
                    Spacer()
                    
                    Text("Begin Bouldering")
                        .foregroundColor(Color("Text"))
                        .font(.title)
                        .bold()
                    
                    
                    CustomTitle(title: "Boulder problem", number: "1")
                        .padding(.top, 30)
                    
                    Text("Identify a route")
                        .foregroundColor(Color("Main"))
                        .bold()
                    
                    Text("Begin by identifying a route or 'problem' of your desired difficulty. Most gyms have tags on the walls to identify the grade.\n")
                    
                    Text("Start position")
                        .foregroundColor(Color("Main"))
                        .bold()
                    
                    Text("Each problem is usually set using holds of the same color and the beggining holds are marked with tape. There should be a limb on each hold that has tape. If a hold has two tapes, for example, then you should begin with both hands on that hold.\n")
                    
                    Text("Finish the problem")
                        .foregroundColor(Color("Main"))
                        .bold()
                    
                    Text("To finish a problem, you should begin in the starting position, use only the color of the problem and climb until you either hold in a stable position with both hands the finishing hold (marked with tape) or get to the top of the wall if there is no finishing hold.")
                    
                    
                    CustomTitle(title: "Tips", number: "2")
                        .padding(.top, 30)
                    
                    Text("""
                       • Keep you arms extended. If possible, keep your center of gravity low, so that you don't get tired when pulling constantly.
                       • Use the tips of your shoes. It may seem scary, but using the tip will allow you to move freely.
                       • Grab holds perpendicularly. Try to keep your arms on a perpendicular position when grabbing a hold to get a better grip.
                """)
                    
                    CustomTitle(title: "Be inclusive", number: "3")
                        .padding(.top, 30)
                    
                    Text("The climbing community is usually very friendly, so don't be afraid to ask for help and be willing to help if anyone requires it. :)")
                    

                    
                }
                .padding(.horizontal, sizeClass == .compact ? 30 : 110)
//                .padding(.vertical, sizeClass == .compact ? 30 : 60)
            }
            
        }
    }
}

#Preview {
    GuideView()
}
