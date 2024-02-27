//
//  SwiftUIView 2.swift
//  
//
//  Created by Alejandra Coeto on 15/02/24.
//

import SwiftUI



struct TipsView: View {
    @StateObject var viewModel = TipsViewVModel()
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(Color("Block"))
                
                
                LazyVStack (alignment: .leading, spacing: 10) {
                    CustomTitle(title: "Tips", number: "2")
                    
                    VStack (alignment: .leading) {
                        
                        HStack {
                            VStack (alignment: .leading) {
                                Text("How to boulder?")
                                    .bold()
                                    .foregroundColor(Color("Text"))
                                    .padding(.top)
                                
                                Text("General tips and rules to begin bouldering")
                                    .foregroundColor(Color("Subtext"))
                            }
                            .padding(.trailing)
                            
                            Spacer()
                            
                            NavigationLink (destination: GuideView()) {
                                VStack {
                                    
                                    Image(systemName: "book")
                                        .foregroundColor(Color("Main"))
                                    Text("See guide")
                                        .foregroundColor(Color("Main"))
                                    
                                }
                                .padding(.top)
                            }
                            
                            
                        }
                        
                        HStack {
                            VStack (alignment: .leading) {
                                Text("Climbing grades")
                                    .bold()
                                    .foregroundColor(Color("Text"))
                                    .padding(.top)
                                
                                Text("Grades help to measure the difficulty of a climb, but can sometimes be subjective.")
                                    .foregroundColor(Color("Subtext"))
                            }
                            .padding(.trailing)
                            
                            Spacer()
                            
                            Button {
                                viewModel.seeGrades = !viewModel.seeGrades
                            } label: {
                                VStack {
                                    
                                    Image(systemName: "tablecells.badge.ellipsis")
                                        .foregroundColor(Color("Main"))
                                    Text("See table")
                                        .foregroundColor(Color("Main"))
                                    
                                }
                                .padding(.top)
                            }
                            .padding(.leading)
                        }
                        .padding(.bottom)
                    }
                    .padding(.horizontal)
                    
                    
                }
                .padding(.horizontal, 20)
                
                .sheet(isPresented: $viewModel.seeGrades, content: {
                    sheetView
                    
                })
                .padding()
                
                
            }
        }

    }
    
    @ViewBuilder
    var sheetView: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                
                Button {
                    viewModel.seeGrades = false
                } label: {
                    Image(systemName: "xmark.circle")
                        .foregroundColor(Color("Main"))
                        .padding()
                        .font(.title2)
                }
            }
            
            Spacer()
            
            Text("Grade system")
                .bold()
                .foregroundColor(Color("Text"))
            
            Text("Depending on the region, people use either v-scale (Mostly in America) or f-scale (mostly in Europe).")
                .foregroundColor(Color("Subtext"))
                .padding()
            
            
            Table(viewModel.grades) {
                TableColumn("V-Scale", value: \.column1)
                TableColumn("Font Scale", value: \.column2)
                TableColumn("Category") { row in
                    Text(row.column3)
                        .foregroundColor(row.color)
                }
            }
            .padding(.horizontal, 50)
            .padding(.vertical)

            
            Spacer()
        }
    }
}

#Preview {
    TipsView()
}
