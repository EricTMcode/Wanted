//
//  ContentView.swift
//  Wanted
//
//  Created by Eric on 11/09/2025.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    @State private var renderedPoster: Image?

    var body: some View {
        NavigationStack {
            Form {
                renderedPoster?
                    .resizable()
                    .scaledToFit()
            }
            .navigationTitle("Design your poster")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(perform: render)
    }

    func render() {
        let renderer = ImageRenderer(
            content: WantedPosterView(
                crime: "Horse Rustling",
                reward: "$500",
                contact: "Turn yourself in, thief!",
                paperOpacity: 0.75))

        if let image = renderer.uiImage {
            renderedPoster = Image(uiImage: image)
        }

    }
}

#Preview {
    ContentView()
}
