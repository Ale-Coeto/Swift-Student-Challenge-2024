//
//  SwiftUIView.swift
//  
//
//  Created by Alejandra Coeto on 20/02/24.
//

import SwiftUI

struct SingleLogView: View {
//
    @ObservedObject var log: Log
    
    var body: some View {
        HStack {
            
            Text("V\(log.level)")
            
            Spacer()
            
            Text(log.activity)
            
            Spacer()
            
            Text(log.date.formatted())
                .foregroundStyle(Color("Subtext"))
            
        }
        .padding()
    }
}



func makeLog() -> Log {
    let logEx = Log(context: PersistenceController.preview.container.viewContext)
    logEx.id = UUID()
    logEx.activity = "climb"
    logEx.date = Date()
    logEx.level = 0
    return logEx
}

#Preview {

    SingleLogView(log: makeLog())

}
