//
//  LanguageEnum.swift
//  Translate
//
//  Created by 한소희 on 1/28/26.
//

import Foundation
import Translation

enum AppLanguage: String, CaseIterable, Codable {
    case ko = "한국어"
    case en = "English"
    case ja = "日本語"
    case zh = "中文"
    
    var title: String {
        switch self {
        case .ko: return "한국어"
        case .en: return "English"
        case .ja: return "日本語"
        case .zh: return "中文"
        }
    }
    
    var translationLanguage: Locale.Language {
        switch self {
        case .ko: return Locale.Language(identifier: "ko")
        case .en: return Locale.Language(identifier: "en")
        case .zh: return Locale.Language(identifier: "zh")
        case .ja: return Locale.Language(identifier: "en")
        }
    }
    
    var id: AppLanguage { self }
}
