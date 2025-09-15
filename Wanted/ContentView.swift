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

    @State private var inputPickerItem: PhotosPickerItem?
    @State private var inputImage: Image?

    @AppStorage("crime") private var crime = "Train Robbery, Horse Rustling, and Other Naughtiness"
    @AppStorage("reward") private var reward = "$500"
    @AppStorage("contact") private var contact = "Contact the Sheriff with any information."
    @AppStorage("paperOpacity") private var paperOpacity = 0.75

    var body: some View {
        NavigationStack {
            Form {
                renderedPoster?
                    .resizable()
                    .scaledToFit()
                    .listRowInsets(EdgeInsets())

                Section {
                    PhotosPicker("Select an image", selection: $inputPickerItem, matching: .images)
                }

                Section("What's their crime?") {
                    TextField("Enter a crime", text: $crime, axis: .vertical)
                }

                Section("What's the reward?") {
                    TextField("Enter a reward", text: $reward)
                }

                Section("Who should they contact?") {
                    TextField("Enter contact details", text: $contact, axis: .vertical)
                }

                Section("Paper opacity") {
                    Slider(value: $paperOpacity)
                }
            }
            .navigationTitle("Design your poster")
            .navigationBarTitleDisplayMode(.inline)
            .listSectionSpacing(.compact)
            .scrollDismissesKeyboard(.interactively)
            .onChange(of: [crime, reward, contact, String(paperOpacity)], render)
            .onChange(of: inputPickerItem) {
                Task {
                    inputImage = try? await inputPickerItem?.loadTransferable(type: Image.self)
                    render()
                }
            }
            .toolbar {
                if let renderedPoster {
                    ShareLink(item: renderedPoster, preview: SharePreview("Wanted for \(crime)", image: renderedPoster))
                }
            }
        }
        .onAppear(perform: render)
    }

    func render() {
        let renderer = ImageRenderer(
            content: WantedPosterView(
                image: inputImage,
                crime: crime,
                reward: reward,
                contact: contact,
                paperOpacity: paperOpacity))
        renderer.scale = 3

        if let image = renderer.uiImage {
            renderedPoster = Image(uiImage: image)
        }

    }
}

#Preview {
    ContentView()
}
