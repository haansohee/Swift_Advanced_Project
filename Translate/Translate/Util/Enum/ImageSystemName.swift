//
//  ImageSystemName.swift
//  Translate
//
//  Created by 한소희 on 1/28/26.
//

import Foundation

enum ImageSystemName {
    case bookmark
    case bookmarkFill
    case copy
    
    var imageName: String {
        switch self {
        case .bookmark: return "bookmark"
        case .bookmarkFill: return "bookmark.fill"
        case .copy: return "doc.on.doc"
        }
    }
}
