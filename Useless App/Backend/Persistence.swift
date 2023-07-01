//
//  Persistence.swift
//  Useless App
//
//  Created by klifton Cheng stu on 1/7/23.
//

import Foundation
import SwiftUI

class FactManager: ObservableObject {
    static let shared: FactManager = .init()
    
    @Published var facts: [String] = [] {
        didSet {
            save()
        }
    }
        
    private init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "Facts.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFacts = try? propertyListEncoder.encode(facts)
        try? encodedFacts?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedFactData = try? Data(contentsOf: archiveURL),
            let factsDecoded = try? propertyListDecoder.decode([String].self, from: retrievedFactData) {
            facts = factsDecoded
        }
    }
}
