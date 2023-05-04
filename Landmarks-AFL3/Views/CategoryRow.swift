//
//  CategoryRow.swift
//  Landmarks-AFL3
//
//  Created by MacBook Pro on 28/04/23.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Agent]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { agent in
                        NavigationLink {
                            AgentDetail(agent: agent)
                        } label: {
                            CategoryItem(agent: agent)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var agents = ModelData().agents

    static var previews: some View {
        CategoryRow(
            categoryName: agents[0].role.rawValue,
            items: Array(agents.prefix(4))
        )
    }
}
