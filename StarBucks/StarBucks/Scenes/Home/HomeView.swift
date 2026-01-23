//
//  HomeView.swift
//  StarBucks
//
//  Created by 한소희 on 1/22/26.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            HomeHeaderView(isNeedToReload: $homeViewModel.isNeedToReload)
            MenuSuggestionSectionView(coffeeMenu: $homeViewModel.coffeeMenu)
            Spacer(minLength: 32.0)
            EventSectionView(events: $homeViewModel.evnets)
        }
    }
}


#Preview {
    HomeView()
}
