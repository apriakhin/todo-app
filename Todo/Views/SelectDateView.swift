//
//  SelectDateView.swift
//  Todo
//
//  Created by Anton Priakhin on 30.04.2022.
//

import SwiftUI

struct SelectDateView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var date: Date
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(uiColor: .secondarySystemBackground)
                    .ignoresSafeArea()
                
                VStack {
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                        .onChange(of: date, perform: { _ in
                            dismiss()
                        })
                        .datePickerStyle(.graphical)
                        .padding(.horizontal)
                    
                    Spacer()
                }
                .toolbar {
                    ToolbarItemGroup(placement: .cancellationAction) {
                        Button(action: { dismiss() }) {
                            Text("Close")
                        }
                    }
                    
                    ToolbarItemGroup(placement: .primaryAction) {
                        Button(action: { date = .now }) {
                            Text("Today")
                                .bold()
                        }
                    }
                }
                .navigationTitle("Select date")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        SelectDateView(date: .constant(.now))
    }
}
