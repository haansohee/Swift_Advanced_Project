//
//  TabEnum.swift
//  StarBucks
//
//  Created by 한소희 on 1/22/26.
//

import SwiftUI

enum Tab {
    case home
    case other
    
    var tabTextItem: Text {
        switch self {
        case .home: return Text("Home")
        case .other: return Text("Other")
        }
    }
    
    var tabImageItem: Image {
        switch self {
        case .home: return Image(systemName: "house.fill")
        case .other: return Image(systemName: "ellipsis")
        }
    }
}
