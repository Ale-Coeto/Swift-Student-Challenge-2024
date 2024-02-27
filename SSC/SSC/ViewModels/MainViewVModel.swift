//
//  File.swift
//  
//
//  Created by Alejandra Coeto on 15/02/24.
//

import Foundation

class MainViewVModel: ObservableObject {
    @Published var landing: Bool = true
    
    init(){}
    func toggle() {
        landing = false
    }
    
    func isLanding() -> Bool {
        return landing
    }
}
