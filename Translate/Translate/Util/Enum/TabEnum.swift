//
//  TabEnum.swift
//  Translate
//
//  Created by 한소희 on 1/24/26.
//

import SwiftUI

enum Tab {
    case translate
    case bookmark
    
    var tabTextItem: Text {
        switch self {
        case .translate: return Text("Translate")
        case .bookmark: return Text("Bookmark")
        }
    }
    
    var tabImageItem: Image {
        switch self {
        case .translate: return Image(systemName: "mic")
        case .bookmark: return Image(systemName: "star")
        }
    }
}
