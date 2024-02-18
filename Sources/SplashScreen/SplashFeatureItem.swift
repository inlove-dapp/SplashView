//
//  File.swift
//
//
//  Created by Qiwei Li on 11/16/23.
//

import Foundation
import SwiftUI

public struct SplashFeatureItem: Identifiable {
    public let id = UUID()
    public let title: LocalizedStringKey
    public let description: LocalizedStringKey
    public let image: URL

    public init(title: LocalizedStringKey, description: LocalizedStringKey, image: URL) {
        self.title = title
        self.description = description
        self.image = image
    }
}
