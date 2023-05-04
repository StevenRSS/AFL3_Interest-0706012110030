//
//  CategoryItem.swift
//  Landmarks-AFL3
//
//  Created by MacBook Pro on 28/04/23.
//

import SwiftUI

struct CategoryItem: View {
    var agent: Agent

    var body: some View {
        VStack(alignment: .leading) {
            agent.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(agent.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(agent: ModelData().agents[0])
    }
}
