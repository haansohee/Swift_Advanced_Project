//
//  Bookmark.swift
//  Translate
//
//  Created by 한소희 on 1/28/26.
//

import Foundation

struct Bookmark: Codable, Identifiable {
    let sourceLanguage: AppLanguage
    let translatedLanguage: AppLanguage
    
    let sourceText: String
    let translatedText: String
    
    var id = UUID()
}
