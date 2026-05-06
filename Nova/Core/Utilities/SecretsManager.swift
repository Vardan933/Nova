//
//  SecretsManager.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 06.05.26.
//

import Foundation

enum SecretsManager {
    private static let fileName = "Secrets"
    private static let fileExtension = "plist"
    
    static var apiKey: String {
        guard let path = Bundle.main.path(forResource: fileName, ofType: fileExtension),
              let dict = NSDictionary(contentsOfFile: path) else {
            fatalError("Missing Secrets.plist file in Resources folder")
        }
        
        guard let value = dict["API_KEY"] as? String else {
            fatalError("API_KEY not found in Secrets.plist")
        }
        
        return value
    }
}
