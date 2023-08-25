//
//  Group.swift
//  WhatsUp
//
//  Created by Christopher Winter on 25.08.23.
//

import Foundation

struct Group: Codable, Identifiable {
    var documentId: String? = nil
    let subject: String
    
    var id: String {
        documentId ?? UUID().uuidString
    }
}


extension Group {
    func toDictionary() -> [String: Any] {
        return ["subject": subject]
    }
}
