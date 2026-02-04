//
//  TranslateViewModel.swift
//  Translate
//
//  Created by 한소희 on 1/25/26.
//

import SwiftUI
import Combine
import Translation

final class TranslateViewModel: ObservableObject {
    // Input
    private(set) var sourceLanguage: AppLanguage = .ko
    private(set) var targetLanguage: AppLanguage = .en
    @Published private(set) var sourceText: String = ""
    
    // Output
    @Published private(set) var translationResultText: String = ""
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String?
    
    @Published private(set) var bookmarks: [Bookmark] = []
    @Published private(set) var bookmarkImageName: ImageSystemName = .bookmark
    
    private var cancellables = Set<AnyCancellable>()
    
    func didEnterText(_ sourceText: String) {
        self.sourceText = sourceText
        bookmarkImageName = ImageSystemName.bookmark
    }
    
    func setSourceLanguage(_ language: AppLanguage) {
        sourceLanguage = language
    }
    
    func setTargetLanguage(_ language: AppLanguage) {
        targetLanguage = language
    }
    
    func setTargetTextResult(_ text: String) {
        translationResultText = text
    }
    
    func didTapBookmarkButton(_ imagesystemName: ImageSystemName) {
        guard !sourceText.isEmpty,
              !translationResultText.isEmpty,
              imagesystemName == ImageSystemName.bookmark else { return } 
        bookmarkImageName = ImageSystemName.bookmarkFill
        
        let currentBookmarks: [Bookmark] = UserDefaults.standard.bookmarks
        let newBookmark = Bookmark(
            sourceLanguage: sourceLanguage,
            translatedLanguage: targetLanguage,
            sourceText: sourceText,
            translatedText: translationResultText
        )
        UserDefaults.standard.bookmarks = [newBookmark] + currentBookmarks
        bookmarks = UserDefaults.standard.bookmarks
    }
    
    func didTapCopyButton() {
        UIPasteboard.general.string = translationResultText
    }
}

