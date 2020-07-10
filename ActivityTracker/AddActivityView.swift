//
//  AddActivityView.swift
//  ActivityTracker
//
//  Created by Barry Martin on 7/9/20.
//  Copyright © 2020 Barry Martin. All rights reserved.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var activities: Activities
    @State private var name = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Add activity name", text: $name)
                TextField("Enter description", text: $description)
            }
            .navigationBarTitle("Add activity")
            .navigationBarItems(trailing: Button("Save") {
                if self.name != "" && self.description != "" {
                    let newActivity = Activity(name: self.name, description: self.description)
                    self.activities.activityList.append(newActivity)
                    self.presentationMode.wrappedValue.dismiss()
                }
                }
            )
        }
    }
}

//struct AddActivityView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddActivityView()
//    }
//}
