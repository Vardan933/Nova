//
//  SettingsView.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 06.05.26.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
            DisclosureGroup("About") {
                Label("Contact Developer", systemImage: "person.circle")
                Label("Privacy Policy", systemImage: "private")
            }
                
                DisclosureGroup("Social Media") {
                    Text("Facebook")
                    Text("Twitter")
                    Text("Instagram")
            }
        }
    }
}

#Preview {
    SettingsView()
}
