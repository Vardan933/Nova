//
//  SettingsView.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 06.05.26.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Developer")) {
                    Link(destination: URL(string: "https://github.com/Vardan933")!) {
                        HStack {
                            Label("GitHub Profile", systemImage: "link")
                            Spacer()
                            Image(systemName: "arrow.up.forward.app")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Button(action: { sendEmail() }) {
                        Label("Contact Developer", systemImage: "envelope")
                    }
                }
                
                Section(header: Text("Application")) {
                    DisclosureGroup {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Nova is a modern news discovery app built with SwiftUI and SwiftData.")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Text("It uses NewsData.io API to fetch the latest updates from around the world.")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 5)
                    } label: {
                        Label("About Nova", systemImage: "sparkles")
                    }
                    
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    func sendEmail() {
        let email = "Vardan.032093@gmail.com"
        let subject = "Feedback on Nova App"
        let mailto = "mailto:\(email)?subject=\(subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
        
        if let url = URL(string: mailto) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    SettingsView()
}
