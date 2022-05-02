//
//  CreateTaskView.swift
//  Todo
//
//  Created by Anton Priakhin on 22.04.2022.
//

import SwiftUI

struct CreateTaskView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var date = Date.now
    @State private var isImportant = false
    
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
                    Button(action: { dismiss() }) {
                        Text("Close")
                    }
                }
                
                ToolbarItemGroup(placement: .primaryAction) {
                    Button(action: { onSave() }) {
                        Text("Save")
                            .bold()
                    }
                    .disabled(isButtonSaveDisabled)
                }
            }
            .navigationTitle("Create task")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func onSave() {
        let task = Task(context: moc)
        task.uuid = UUID()
        task.title = title
        task.date = date
        task.isImportant = isImportant
        task.isDone = false
        
        try? moc.save()
        dismiss()
    }
    
    private var isButtonSaveDisabled: Bool {
        title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTaskView()
    }
}
