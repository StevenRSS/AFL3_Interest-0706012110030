//
//  AgentDetail.swift
//  Landmarks-AFL3
//
//  Created by MacBook Pro on 04/05/23.
//

import SwiftUI

public struct AgentDetail: View {
    @EnvironmentObject var modelData: ModelData
    var agent: Agent

    var agentIndex: Int {
        modelData.agents.firstIndex(where: { $0.id == agent.id })!
    }

    public var body: some View {
        ScrollView {
            agent.image
                .resizable()
                .cornerRadius(5)
            CircleImage(image: agent.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(agent.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.agents[agentIndex].isFavorite)
                }

                HStack {
                    Text(agent.roles)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(agent.name)")
                    .font(.title2)
                Text(agent.description)
            }
            .padding()
        }
        .navigationTitle(agent.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AgentDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        AgentDetail(agent: modelData.agents[0])
            .environmentObject(modelData)
    }
}

