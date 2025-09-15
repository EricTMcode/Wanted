//
//  WantedPosterView.swift
//  Wanted
//
//  Created by Eric on 15/09/2025.
//

import SwiftUI

struct WantedPosterView: View {
    var image: Image?
    var crime: String
    var reward: String
    var contact: String
    var paperOpacity: Double

    var body: some View {
        VStack(spacing: 0) {
            Text("WANTED")
            Text("DEAD OR ALIVE")

            image

            Text("For \(crime)")

            Spacer()

            Text("REWARD")
            Text(reward)

            Spacer()

            Text(contact)
        }
    }
}

#Preview {
    WantedPosterView(crime: "Horse Rustling", reward: "$500", contact: "Turn yourself in, thief!", paperOpacity: 0.75)
}
