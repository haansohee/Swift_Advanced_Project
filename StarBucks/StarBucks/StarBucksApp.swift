//
//  StarBucksApp.swift
//  StarBucks
//
//  Created by 한소희 on 1/22/26.
//

import SwiftUI

@main
struct StarBucksApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .accentColor(.green)
        }
    }
}
