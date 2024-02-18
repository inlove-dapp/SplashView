//
//  SwiftUIView.swift
//
//
//  Created by Qiwei Li on 11/16/23.
//

import Kingfisher
import SwiftUI

public struct SplashFeatureScreen: View {
    @State private var selection: Int = 0

    private let features: [SplashFeatureItem]
    private let color: Color
    private let continueText: LocalizedStringKey
    private let onTap: () -> Void

    public init(features: [SplashFeatureItem], color: Color, continueText: LocalizedStringKey, onTap: @escaping () -> Void) {
        self.features = features
        self.color = color
        self.continueText = continueText
        self.onTap = onTap
    }

    public var body: some View {
        let isLastSelection = selection == features.count - 1
        TabView(selection: $selection) {
            ForEach(Array(features.enumerated()), id: \.offset) { index, feature in
                VStack {
                    Group {
                        if feature.image.absoluteString.hasSuffix(".gif") {
                            KFAnimatedImage(feature.image)
                                .placeholder {
                                    ZStack {
                                        Color.purple.opacity(0.1)
                                        ProgressView()
                                    }
                                }
                        } else {
                            KFImage.url(feature.image)
                                .placeholder {
                                    ZStack {
                                        Color.purple.opacity(0.1)
                                        ProgressView()
                                    }
                                }
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                    .frame(height: 400)

                    HStack {
                        VStack(alignment: .leading) {
                            Text(feature.title)
                                .font(.title)
                            Text(feature.description)
                                .font(.body)
                        }
                        .padding(.horizontal)
                        Spacer()
                    }
                    Spacer()
                    if isLastSelection {
                        Button(action: {
                            onTap()
                        }, label: {
                            Text(continueText)
                                .frame(maxWidth: .infinity)
                        })
                        .padding(.all, 20.0)
                        .buttonStyle(.borderedProminent)
                        .tint(color)
                        .controlSize(.large)
                        .transition(.slide)
                    }
                }
                .tag(index)
            }
        }
        #if os(iOS)
        .tabViewStyle(.page(indexDisplayMode: isLastSelection ? .never : .always))
        #endif
    }
}

#Preview {
    SplashFeatureScreen(features: [
        .init(title: "Test", description: "Image", image: .init(string: "https://s3.metopia.co/website3.0/images/blockchain4.jpg")!),
        .init(title: "Test", description: "Image", image: .init(string: "https://s3.metopia.co/website3.0/images/blockchain4.jpg")!)
    ], color: .purple, continueText: "Contine") {}
}
