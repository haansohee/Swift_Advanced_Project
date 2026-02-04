//
//  BookmarkRow.swift
//  Translate
//
//  Created by 한소희 on 2/1/26.
//

import SwiftUI

struct BookmarkRow: View {
    let bookmarks: Bookmark
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("\(bookmarks.sourceLanguage.title)")
                    .font(.system(size: 16.0, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                Text("\(bookmarks.sourceText)")
                    .font(.system(size: 16.0, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            .padding(.vertical, 10)
            
            VStack(alignment: .leading) {
                Text("\(bookmarks.translatedLanguage.title)")
                    .font(.system(size: 16.0, weight: .semibold))
                    .foregroundColor(Color(UIColor.mainTintColor))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                Text("\(bookmarks.translatedText)")
                    .font(.system(size: 16.0, weight: .semibold))
                    .foregroundColor(Color(UIColor.mainTintColor))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            .padding(.vertical, 10)
        }
    }
}
