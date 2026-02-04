//
//  BookmarkView.swift
//  Translate
//
//  Created by 한소희 on 1/24/26.
//

import SwiftUI

struct BookmarkView: View {
    @StateObject var bookmarkViewModel = BookmarkViewModel()
    
    var body: some View {
        NavigationView {
            List(bookmarkViewModel.bookmarks) { bookmark in
                BookmarkRow(bookmarks: bookmark)
            }
                .navigationTitle("즐겨찾기")
        }
        .onAppear() {
            bookmarkViewModel.fetchBookmarks()
        }
    }
}
