//
//  Agents.swift
//  Landmarks-AFL3
//
//  Created by MacBook Pro on 04/05/23.
//

import Foundation
import SwiftUI

struct Agent: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var roles: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var role: Role
    enum Role: String, CaseIterable, Codable, Hashable {
        case duelist = "Duelist"
        case controller = "Controller"
        case initiator = "Initiator"
        case sentinel = "Sentinel"
    }

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
}
