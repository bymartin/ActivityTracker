//
//  Activity.swift
//  ActivityTracker
//
//  Created by Barry Martin on 7/8/20.
//  Copyright © 2020 Barry Martin. All rights reserved.
//

import Foundation

struct Activity: Identifiable, Codable {
    let id = UUID()
    let name: String
    let description: String
}


class Activities: ObservableObject {
    @Published var activityList = [Activity]() {
        didSet {
            let enc = JSONEncoder()
            if let encoded = try? enc.encode(activityList) {
                UserDefaults.standard.set(encoded, forKey: "activities")
            }
        }
    }
    
    init() {
        if let activities = UserDefaults.standard.data(forKey: "activities") {
            let dec = JSONDecoder()
            if let decoded = try? dec.decode([Activity].self, from: activities) {
                self.activityList = decoded
                return
            }
        }
        self.activityList = []
    }    
}
