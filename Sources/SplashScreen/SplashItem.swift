//
//  File.swift
//
//
//  Created by Qiwei Li on 11/16/23.
//

import Foundation
import SwiftUI

public struct SplashItem {
    public let name: LocalizedStringKey
    public let description: LocalizedStringKey
    public let icon: String

    public init(name: LocalizedStringKey, description: LocalizedStringKey, icon: String) {
        self.name = name
        self.description = description
        self.icon = icon
    }
}

public struct SplashConfig {
    public let title: LocalizedStringKey
    public let welcomeMessage: LocalizedStringKey
    public let buttonText: LocalizedStringKey
    public let icon: String
    public let color: Color
    public let items: [SplashItem]

    public init(title: LocalizedStringKey, welcomeMessage: LocalizedStringKey, buttonText: LocalizedStringKey, icon: String, color: Color, items: [SplashItem]) {
        self.title = title
        self.welcomeMessage = welcomeMessage
        self.buttonText = buttonText
        self.icon = icon
        self.color = color
        self.items = items
    }
}
