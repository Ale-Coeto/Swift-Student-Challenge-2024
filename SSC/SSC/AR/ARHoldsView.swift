//
//  SwiftUIView.swift
//  
//
//  Created by Alejandra Coeto on 13/02/24.
//

import SwiftUI

struct ARHoldsView: View {
    @State private var holds: [String] = [
        "Types of holds",
        "Jug",
        "Crimp",
        "Sloper",
        "Pinch",
        "Pocket"
    ]
    
    @State private var descriptions: [String] = [
        "Use the right or left arrows to explore different holds and tap on the + button to place it in a wall.",
        "Best type of hold. It can be grabbed with the entire hand almost like a bar",
        "Small hold that only fits the tips of your fingers. It can be held in an open hand position, crimp position or full crimp. Tip: make sure you warmed-up before grabbing small holds to prevent injury.",
        "Rounded large holds that require a lot of friction and wrist strength. It is best to grab with open-hand position to increase friction and keep center of gravity low.",
        "This hold is usually in a vertical positoin. It is best to use the thumb to wrap the hold.",
        "Pockets are held usually with 2 or even one finger. It is usually held with either the ring and middle finger or index and middle finger, it is up to each climber's preference. Should be held carefully to prevent injury."
    ]
    @State private var selection = 0
    
    var body: some View {
                
            
            CustomARViewRepresentable()
                .ignoresSafeArea()
                .overlay() {
                    VStack {

                        Text(holds[selection])
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                            .background(.white.opacity(0.6))
                            .cornerRadius(8.0)
                        
                        Text(descriptions[selection])
                            .foregroundColor(.black)
                            .padding(.all)
                            .background(.white.opacity(0.6))
                            .cornerRadius(8)

                        
                        Spacer()
                        
                        HStack {
                            if selection != 0 {
                                Button {
                                    selection = selection - 1
                                } label: {
                                    Image(systemName: "chevron.left.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50)
                                    
                                }
                            }
                            
                            Spacer()
                            
                            if selection != holds.count-1 {
                                Button {
                                    selection += 1
                                } label: {
                                    Image(systemName: "chevron.right.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50)
                                }
                            }
                        }
                            .padding()
                            .foregroundColor(Color("Highlights"))
                        
                        Spacer()

                        if selection != 0 {
                            HStack {
                                Button {
                                    ARManager.shared.actionStream.send(.removeAllAnchors)
                                } label: {
                                    Image(systemName: "trash")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                        .padding()
                                        .background(.regularMaterial)
                                        .cornerRadius(16)
                                }
                                
                                Button {
                                    ARManager.shared.actionStream.send(.placeHold(type: holds[selection].lowercased()))
                                } label: {
                                    Image(systemName: "plus")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                        .padding()
                                        .background(.regularMaterial)
                                        .cornerRadius(16)
                                }

                            }
                            .padding()
                            .foregroundColor(Color("Main"))
                        }
                    
                }
        }
    }
}

#Preview {
    ARHoldsView()
}
