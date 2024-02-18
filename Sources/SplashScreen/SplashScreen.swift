//
//  SwiftUIView.swift
//
//
//  Created by Qiwei Li on 11/16/23.
//

import SwiftUI

public struct SplashScreen: View {
    private let config: SplashConfig
    private let onContinue: () -> Void

    public init(config: SplashConfig, onContinue: @escaping () -> Void) {
        self.config = config
        self.onContinue = onContinue
    }

    public var body: some View {
        VStack {
            ScrollView {
                Image(systemName: config.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, alignment: .center)
                    .accessibility(hidden: true)
                    .foregroundColor(config.color)
                Text(config.welcomeMessage)
                    .fontWeight(.black)
                    .font(.largeTitle)
                Text(config.title)
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundColor(config.color)
                ForEach(config.items, id: \.icon) { item in
                    HStack {
                        Image(systemName: item.icon)
                            .font(.largeTitle)
                            .foregroundColor(config.color)
                            .frame(width: 70)
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text(item.description)
                                .foregroundStyle(.secondary)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        Spacer()
                    }
                }
                .padding(.top)
            }
            Spacer()
            Button(action: {
                onContinue()
            }, label: {
                Text(config.buttonText)
                    .frame(maxWidth: .infinity)
            })
            .padding()
            .buttonStyle(.borderedProminent)
            .tint(config.color)
            .controlSize(.large)
        }
    }
}

#Preview {
    SplashScreen(
        config: .init(title: "Hello", welcomeMessage: "Welcome to", buttonText: "Continue", icon: "ruler.fill", color: .purple, items: [
            .init(name: "Match", description: "You can also embed a NavigationStack in a column.", icon: "eraser.fill"),
            .init(name: "Match2", description: "You can also embed a NavigationStack in a column.", icon: "trash.square.fill"),
            .init(name: "Match3", description: "You can also embed a NavigationStack in a column.", icon: "folder.fill")
        ])
    ) {}
}
