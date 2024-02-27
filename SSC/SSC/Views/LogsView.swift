//
//  SwiftUIView 2.swift
//  
//
//  Created by Alejandra Coeto on 15/02/24.
//

import SwiftUI
import Charts
import CoreData

struct LogsView: View {
    
    @StateObject var viewModel = LogsViewVModel()
    @Environment(\.managedObjectContext) private var viewContext
    
    
        
        @FetchRequest(
            entity: Log.entity(),
            sortDescriptors: [
                NSSortDescriptor(keyPath: \Log.date, ascending: true)

            ],
            animation: .default
        )
    
        private var logs: FetchedResults<Log>
    
    private func delete(obj: NSManagedObject) {
        viewContext.delete(obj)
        do {
            try viewContext.save()
        } catch {
            // handle the Core Data error
        }
    }
    
    struct LogFrequency: Identifiable {
        let id = UUID()
        let level: Int16
        let frequency: Int
    }
    
    func getFrequencies() -> [LogFrequency] {
        var freq: [Int16: Int] = [:]
        
          for log in logs {
              let level = log.level
              freq[level, default: 0] += 1
          }
        
        let logFrequencies: [LogFrequency] = freq.map { LogFrequency(level: $0.key, frequency: $0.value) }

        return logFrequencies
    }
    

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Monitor your progress. Log your climbing activity and see results over time.")
                    Spacer()
                }
                .padding(20)
                
                HStack {
                    
                    ChartsView
                    
                    if logs.count == 0 {
                        Text("No Logs so far")
                        
                    } else {
                        VStack {
                            Text("Logs: \(logs.count)")
                                List {
                                    ForEach(logs) { log in
                                        SingleLogView(log: log)
                                    }
                                    .swipeActions {
                                        Button("Delete") {
//                                            delete(obj: log)

                                        }
                                        .accentColor(Color.red)
                                    }
                                   
                                }
                        }
                    }
                }
                .padding()
                
                
                
                Spacer()
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .frame(maxWidth: .infinity)
            .background(Color("Background"))
            .navigationTitle("Logs")
            .toolbar {
                Button {
                    viewModel.addItem = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(Color("Main"))
                        .padding()
                }
            }
            .sheet(isPresented: $viewModel.addItem) {
                NewLogView(isShowing: $viewModel.addItem)
            }
        }
    }
    
    @ViewBuilder
    var ChartsView: some View {
        
            if logs.count == 0 {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("Block"))
                    
                    VStack (spacing: 20) {
                        Spacer()
                        Text("No logs yet.\n Add a new log to begin monitoring your training")
                            .multilineTextAlignment(.center)
                        
                        CustomBtn(text: "Add Log", btn: true) {
                            viewModel.addItem = true
                        }
                        .frame(width: 140, height: 40)
                        Spacer()
                        
                    }
                }
                
            }
            
            else {
                VStack {
                    
                    Text("Frequencies")
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("Block"))
                        
                        Chart(getFrequencies()) { data in
                            
                            BarMark(x: .value("Level", "V\(data.level)"), y: .value("Total", data.frequency))
                                .annotation(position: .top) {
                                    Text(String(data.frequency))
                                        .font(.caption)
                                        .foregroundColor(Color("Subtext"))
                                }
                                .foregroundStyle(Color("Main"))
                            
                        }
                        .chartXAxis(.visible)
                        .chartXAxisLabel("Level")
                        .chartYAxisLabel("Total")
                        .chartYAxis {
                            AxisMarks { _ in
                                AxisValueLabel()
                            }
                        }.padding()
                    }
                    
                    Spacer()
                    
                    Text("Grades over time")
                    
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("Block"))
                        
                        Chart {
                            ForEach(logs) { log in
                                LineMark(x: .value("Date", log.date, unit: .day), y: .value("Level", log.level))
                                    .foregroundStyle(Color("Highlights"))
                            }
                        }
                        .chartXAxisLabel("Date")
                        .chartYAxisLabel("Level")
                        .padding()
                    }
                    
                    
                }.padding()
            }
        
    }
    
    
    

}



#Preview {
    LogsView()
}
