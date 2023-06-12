//
//  Localization.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 12.06.2023.
//

import Foundation

enum Localization: String {
    case navigationBarTitle
    case backButtonTitle

    var localized: String {
        NSLocalizedString(String(describing: Self.self) + "_\(rawValue)", comment: "")
    }
}
