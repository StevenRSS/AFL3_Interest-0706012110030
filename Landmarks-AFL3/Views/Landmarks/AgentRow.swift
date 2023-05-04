//
//  AgentRow.swift
//  Landmarks-AFL3
//
//  Created by MacBook Pro on 04/05/23.
//

import SwiftUI

struct AgentRow: View {
    var agent: Agent

    var body: some View {
        HStack {
            agent.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(agent.name)
                    .bold()
            }

            Spacer()

            if agent.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

struct AgentRow_Previews: PreviewProvider {
    static var agents = ModelData().agents

    static var previews: some View {
        Group {
            AgentRow(agent: agents[0])
            AgentRow(agent: agents[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
