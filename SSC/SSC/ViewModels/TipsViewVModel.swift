//
//  File.swift
//  
//
//  Created by Alejandra Coeto on 25/02/24.
//

import Foundation
import SwiftUI

struct RowData: Identifiable {
    let id = UUID()
    
    let column1: String
    let column2: String
    let column3: String
    let color: Color
}

class TipsViewVModel : ObservableObject {
    @Published var seeGrades = false
    @Published var seeGuide = false
    
    @Published var grades = [
        RowData(column1: "V0/VB", column2: "4", column3: "Beginner", color: .green),
        RowData(column1: "V1", column2: "5", column3: "Beginner", color: .green),
        RowData(column1: "V2", column2: "5+", column3: "Beginner", color: .green),
        RowData(column1: "V3", column2: "6a", column3: "Intermediate", color: .blue),
        RowData(column1: "V4", column2: "6a+", column3: "Intermediate", color: .blue),
        RowData(column1: "V5", column2: "6c", column3: "Intermediate", color: .blue),
        RowData(column1: "V6", column2: "6c+", column3: "Intermediate", color: .blue),
        RowData(column1: "V7", column2: "7a+", column3: "Advanced", color: .red),
        RowData(column1: "V8", column2: "7b", column3: "Advanced", color: .red),
        RowData(column1: "V9", column2: "7c", column3: "Advanced", color: .red),
        RowData(column1: "V10", column2: "7c+", column3: "Advanced", color: .red),
        RowData(column1: "V11", column2: "8a", column3: "Pro", color: .black),
        RowData(column1: "V12", column2: "8a+", column3: "Pro", color: .black),
        RowData(column1: "V13", column2: "8b", column3: "Pro", color: .black),
        RowData(column1: "V14", column2: "8b+", column3: "Pro", color: .black),
    ]
    
}

