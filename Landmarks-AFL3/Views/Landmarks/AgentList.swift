//
//  AgentList.swift
//  Landmarks-AFL3
//
//  Created by MacBook Pro on 04/05/23.
//

import SwiftUI

struct AgentList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    @State private var selectedAgent: Agent?

    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case duelist = "Duelist"
        case controller = "Controller"
        case initiator = "Initiator"
        case sentinel = "Sentinel"

        var id: FilterCategory { self }
    }

    var filteredAgents: [Agent] {
        modelData.agents.filter { agent in
            (!showFavoritesOnly || agent.isFavorite)
                && (filter == .all || filter.rawValue == agent.role.rawValue)
        }
    }

    var title: String {
        let title = filter == .all ? "Agents" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }

    var index: Int? {
        modelData.agents.firstIndex(where: { $0.id == selectedAgent?.id })
    }

    var body: some View {
        NavigationView {
            List(selection: $selectedAgent) {
                ForEach(filteredAgents) { agent in
                    NavigationLink {
                        AgentDetail(agent: agent)
                    } label: {
                        AgentRow(agent: agent)
                    }
                    .tag(agent)
                }
            }
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Role", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)

                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }

            Text("Select a Landmark")
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

struct AgentList_Previews: PreviewProvider {
    static var previews: some View {
        AgentList()
            .environmentObject(ModelData())
    }
}

