//
//  ContentView.swift
//  ActivityTracker
//
//  Created by Barry Martin on 7/8/20.
//  Copyright © 2020 Barry Martin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activities = Activities()
    @State private var showAddView = false
    
    
    
    var body: some View {
        NavigationView {
            List(activities.activityList) { activity in
                VStack(alignment: .leading) {
                    Text(activity.name)
                        .font(.headline)
                    Text(activity.description)
                        .font(.caption)
                }
            }
            .navigationBarTitle("Habit Tracker")
            .navigationBarItems(trailing: Button(action: {
                self.showAddView = true
            }) {
                Image(systemName: "plus")
            })
                .sheet(isPresented: $showAddView) {
                    AddActivityView(activities: self.activities)
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
