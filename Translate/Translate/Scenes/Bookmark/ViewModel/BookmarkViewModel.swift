//
//  BookmarkViewModel.swift
//  Translate
//
//  Created by 한소희 on 2/1/26.
//

import SwiftUI
import Combine

final class BookmarkViewModel: ObservableObject {
    @Published private(set) var bookmarks: [Bookmark] = []
    
    init() {
        fetchBookmarks()
    }
    
    func fetchBookmarks() {
        bookmarks = UserDefaults.standard.bookmarks
    }
}
