//
//  FeatureCard.swift
//  Landmarks-AFL3
//
//  Created by MacBook Pro on 28/04/23.
//

import SwiftUI

struct FeatureCard: View {
    var agent: Agent

    var body: some View {
        agent.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay {
                TextOverlay(agent: agent)
            }
    }
}

struct TextOverlay: View {
    var agent: Agent

    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(agent.name)
                    .font(.title)
                    .bold()
                Text(agent.roles)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(agent: ModelData().featuresAgent[0])
    }
}
