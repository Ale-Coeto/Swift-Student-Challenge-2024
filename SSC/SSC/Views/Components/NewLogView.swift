//
//  SwiftUIView.swift
//  
//
//  Created by Alejandra Coeto on 19/02/24.
//

import SwiftUI
import CoreData

struct NewLogView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var isShowing: Bool
    @StateObject var viewModel = NewLogViewVModel()
  
    
    var body: some View {
        
        VStack {
            Text("Add Log")
                .font(.title)
            
            
            Form {
                
                TextField("Description", text: $viewModel.activity)
                    
                List {
                    Picker("Level", selection: $viewModel.level) {
                        Text("V0/VB").tag(0)

                        ForEach (1...15, id: \.self) { option in
                            Text("V\(option)")
                        }
                    }.pickerStyle(MenuPickerStyle())
                }

                DatePicker("Date", selection: $viewModel.date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                CustomBtn(text: "Save", btn: true) {
                    guard viewModel.activity.trimmingCharacters(in: .whitespaces) != "" else { return }
                    
                    self.addLog()
                    self.isShowing = false
                }
                
            }
            
        }
        
    }
    
    private func addLog() -> Void {
        let newLog = Log(context: viewContext)
        newLog.id = UUID()
        newLog.activity = viewModel.activity
        newLog.level =  Int16(viewModel.level)
        newLog.date = viewModel.date
        
        do {
            try viewContext.save()
            print("done")
        } catch {
            print("error")
            print(error.localizedDescription)
        }
    }
}



#Preview {
    NewLogView(isShowing: .constant(true))
}
