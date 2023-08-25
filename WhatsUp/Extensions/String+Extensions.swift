//
//  String+Extensions.swift
//  WhatsUp
//
//  Created by Christopher Winter on 25.08.23.
//

import Foundation

extension String {

    var isEmptyOrWhitespace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
