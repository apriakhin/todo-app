//
//  CreateTaskView.swift
//  Todo
//
//  Created by Anton Priakhin on 22.04.2022.
//

import SwiftUI

struct CreateTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var date = Date.now
    @State private var isImportant = false
    
    let onTaskSaved: (Task) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                    
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                    
                    Toggle(isOn: $isImportant) { Text("Important") }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .cancellationAction) {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Text("Close")
                    }
                }
                
                ToolbarItemGroup(placement: .primaryAction) {
                    Button(action: { onSave() }) {
                        Text("Save")
                    }
                    .disabled(isButtonSaveDisabled)
                }
            }
            .navigationTitle("Create task")
        }
    }
    
    private func onSave() {
        let task = Task(title: title, date: date, isImportant: isImportant, isDone: false)
        onTaskSaved(task)
        presentationMode.wrappedValue.dismiss()
    }
    
    private var isButtonSaveDisabled: Bool {
        title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTaskView(onTaskSaved: { _ in })
    }
}
