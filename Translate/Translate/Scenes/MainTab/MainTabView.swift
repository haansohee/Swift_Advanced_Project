//
//  ContentView.swift
//  Translate
//
//  Created by 한소희 on 1/24/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            TranslateView()
                .tabItem {
                    Tab.translate.tabImageItem
                    Tab.translate.tabTextItem
                }
            BookmarkView()
                .tabItem {
                    Tab.bookmark.tabImageItem
                    Tab.bookmark.tabTextItem
                }
        }
    }
}

#Preview {
    MainTabView()
}
