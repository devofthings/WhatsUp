//
//  AppState.swift
//  WhatsUp
//
//  Created by Christopher Winter on 25.08.23.
//

import Foundation

enum Route: Hashable {
    case main
    case login
    case register
}

class AppState: ObservableObject {
    @Published var routes: [Route] = []
    
}
