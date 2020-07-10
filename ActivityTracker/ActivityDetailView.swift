//
//  ActivityDetailView.swift
//  ActivityTracker
//
//  Created by Barry Martin on 7/10/20.
//  Copyright © 2020 Barry Martin. All rights reserved.
//

import SwiftUI

struct ActivityDetailView: View {
    var index: Int
    
    //@State var activity: Activity
    @EnvironmentObject var activities: Activities
    
    var body: some View {
        VStack {
            Spacer()
            Text(activities.activityList[index].name)
                .font(.largeTitle)
            Text(activities.activityList[index].description)
                .font(.caption)
            Spacer()
            Text("Completed \(activities.activityList[index].numberOfCompletions) times")
            Spacer()
            Button("Increment activity") {
                self.activities.activityList[self.index].incrementCompletions()
            }
            Spacer()
        }
    }
}

//struct ActivityDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityDetailView()
//    }
//}
