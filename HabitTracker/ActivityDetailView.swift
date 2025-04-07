//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by Omolemo Mashigo on 2025/04/07.
//

import SwiftUI

struct ActivityDetailView: View {
    let activity: Activity
    var activities: Activities
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
                Text(activity.title)
                    .font(.largeTitle.bold())
                Text(activity.description)
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Spacer()
            
            Text("Completed \(activity.completionCount) times")
                .font(.title2)
            
            Button {
                incrementCompletion()
            } label: {
                Text("Mark Completed")
                    .font(.title2.bold())
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func incrementCompletion() {
        guard let index = activities.items.firstIndex(of: activity) else { return }
        var newActivity = activity
        newActivity.completionCount += 1
        activities.items[index] = newActivity
    }
}
