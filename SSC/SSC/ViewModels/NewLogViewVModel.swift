//
//  File.swift
//  
//
//  Created by Alejandra Coeto on 19/02/24.
//

import Foundation
import CoreData

//struct levelStruct {
//    tag: String,
//    value: Int16
//}

class NewLogViewVModel: ObservableObject {

    @Published var activity: String = ""
    @Published var level = 0
    @Published var date: Date = Date()
    
    
    
    init() {
        
    }
    
   
}
