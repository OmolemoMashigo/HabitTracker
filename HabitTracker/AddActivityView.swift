//
//  AddActivityView.swift
//  HabitTracker
//
//  Created by Omolemo Mashigo on 2025/04/07.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss
    var activities: Activities
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add Activity")
            .toolbar {
                Button("Save") {
                    let activity = Activity(title: title, description: description)
                    activities.items.append(activity)
                    dismiss()
                }
                .disabled(title.isEmpty || description.isEmpty)
            }
        }
    }
}
