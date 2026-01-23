//
//  MainTabView.swift
//  StarBucks
//
//  Created by 한소희 on 1/22/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Tab.home.tabImageItem
                    Tab.home.tabTextItem
                }
            OtherView()
                .tabItem {
                    Tab.other.tabImageItem
                    Tab.other.tabTextItem
                    Text("Other")
                }
        }
    }
}

#Preview {
    MainTabView()
}
