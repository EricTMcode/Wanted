//
//  WantedPosterView.swift
//  Wanted
//
//  Created by Eric on 11/09/2025.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    static var darkBrown: Color {
        Color(red: 0.3, green: 0.2, blue: 0.1)
    }
}

struct WantedPosterView: View {
    var image: Image?
    var crime: String
    var reward: String
    var contact: String
    var paperOpacity: Double


    var body: some View {
        ZStack {
            Image(.paper)
                .resizable()
                .scaledToFill()
                .frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity)
                .opacity(paperOpacity)

            VStack(spacing: 0) {
                Text("WANTED")
                    .font(.custom("Superclarendon", size: 60))
                    .fontWeight(.black)
                    .tracking(5)
                    .foregroundStyle(.darkBrown)
                    .padding(.bottom, -10)

                Text("DEAD OR ALIVE")
                    .font(.custom("Copperplate", size: 24))
                    .bold()
                    .tracking(2)
                    .foregroundStyle(.darkBrown)

                image?
                    .resizable()
                    .scaledToFill()
                    .frame(width: 270, height: 270)
                    .clipShape(.circle)
                    .grayscale(1)
                    .blendMode(.multiply)
                    .overlay {
                        Circle()
                            .strokeBorder(.darkBrown, lineWidth: 8)
                    }
                    .padding(.vertical, 10)

                Text("For \(crime)")
                    .font(.custom("Copperplate", size: 22))
                    .multilineTextAlignment(.center)
                    .bold()
                    .tracking(1)
                    .foregroundStyle(.darkBrown)


                Spacer()

                Text("REWARD")
                    .font(.custom("Copperplate", size: 30))
                    .tracking(3)
                    .bold()
                    .foregroundStyle(.darkBrown)

                Text(reward)
                    .font(.custom("Copperplate", size: 44))
                    .bold()
                    .tracking(2)
                    .foregroundStyle(.darkBrown)

                Spacer()

                Text(contact)
                    .font(.custom("Copperplate", size: 18))
                    .multilineTextAlignment(.center)
                    .bold()
                    .foregroundStyle(.darkBrown)
                    .padding(.bottom, 10)
            }
            .shadow(color: .white, radius: 3)
            .padding(.horizontal)
        }
        .frame(width: 420, height: 594)
    }
}

#Preview {
    WantedPosterView(crime: "Horse Rustling", reward: "$500", contact: "Turn youself in thief!", paperOpacity: 0.75)
}
