//
//  SettingsView.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 06.05.26.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section {
                    Toggle(isOn: $isDarkMode) {
                        Label {
                            Text("Dark Mode")
                        } icon: {
                            Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                                .foregroundColor(isDarkMode ? .purple : .orange)
                        }
                    }
                    .tint(.blue)
                } header: {
                    Text("Appearance")
                }
                
                Section {
                    Link(destination: URL(string: "https://github.com/Vardan933")!) {
                        HStack {
                            Label("GitHub Profile", systemImage: "person.crop.circle.fill")
                            Spacer()
                            Image(systemName: "arrow.up.forward.app")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Button(action: sendEmail) {
                        Label("Contact Developer", systemImage: "envelope.fill")
                    }
                    .foregroundColor(.primary)
                } header: {
                    Text("Developer")
                }
                
                Section {
                    DisclosureGroup {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Nova is a modern news discovery app built with SwiftUI and SwiftData.")
                            Text("It uses NewsData.io API to fetch the latest updates from around the world.")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.vertical, 8)
                    } label: {
                        Label("About Nova", systemImage: "sparkles")
                    }
                    
                    HStack {
                        Label("Version", systemImage: "info.circle")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }
                } header: {
                    Text("Application")
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    private func sendEmail() {
        let email = "Vardan.032093@gmail.com"
        let subject = "Feedback on Nova App"
        let mailto = "mailto:\(email)?subject=\(subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
        
        if let url = URL(string: mailto), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    SettingsView()
}
