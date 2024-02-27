//
//  File.swift
//  
//
//  Created by Alejandra Coeto on 25/02/24.
//
import Combine
import Foundation

class ARManager {
    static let shared = ARManager()
    private init(){}
    
    var actionStream = PassthroughSubject<ARAction, Never>()
}
