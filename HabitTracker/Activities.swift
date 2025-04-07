//
//  Activities.swift
//  HabitTracker
//
//  Created by Omolemo Mashigo on 2025/04/07.
//
import SwiftUI

struct Activity: Identifiable, Codable, Equatable {
    var id = UUID()
    let title: String
    let description: String
    var completionCount: Int = 0
}

@Observable
class Activities {
    var items = [Activity]() {
        didSet {
            save()
        }
    }
    
    init() {
        load()
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "Activities")
        }
    }
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: "Activities") {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: data) {
                items = decoded
                return
            }
        }
        items = []
    }
}
