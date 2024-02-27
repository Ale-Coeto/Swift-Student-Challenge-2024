//
//  SwiftUIView.swift
//  
//
//  Created by Alejandra Coeto on 08/02/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewVModel()
    
    var body: some View {
        
        // Landing page
        if viewModel.landing {
            LandingView
            
        // Main
        } else {
            
                TabView {

                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                                
                               
                        }
                    LogsView()
                        .tabItem {
                            Label("Logs", systemImage: "bookmark")
                                .foregroundColor(Color("Main"))
                        }
                    
                
                }
                .accentColor(Color("Main"))
        
        }
        
    }
    
    // Landing page view
    @ViewBuilder
    var LandingView: some View {
        NavigationStack {
            ZStack (alignment: .center) {
                Rectangle()
                    .foregroundColor(Color("Background"))
                
                VStack {
                    Spacer()
                    Image("Mountains")
                        .resizable()
                        
                }
                
                VStack {
                    
                    Spacer()
                    
                    Text("ALL CLIMB")
                        .foregroundColor(Color("Highlights"))
                        .fontWeight(.bold)
                        .font(.system(size: 55, design: .default))

                    
                    Text("Begin your jouney today")
                        .padding(.top)
                        .foregroundColor(Color("Subtext"))
                        .font(.system(size: 20))
                        
                    
                    Spacer()
                    
                    
                    NavigationLink(destination: IntroView(landing: $viewModel.landing)) {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color("Main"))
                                .frame(width: 100, height: 40)
                            
                            Text("Start")
                                .foregroundColor(Color.white)
                                .bold()
                                
                        }
             
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
            .ignoresSafeArea()
            
        }
        
        
    }
}



#Preview {
    MainView()
}
