//
//  Model.swift
//  WhatsUp
//
//  Created by Christopher Winter on 25.08.23.
//

import Foundation
import FirebaseAuth

@MainActor
class Model: ObservableObject {
    func updateDisplayName(for user: User, displayName: String) async throws {
        let request = user.createProfileChangeRequest()
        request.displayName = displayName
        try await request.commitChanges()
    }
}
