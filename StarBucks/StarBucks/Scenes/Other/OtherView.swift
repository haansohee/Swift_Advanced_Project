//
//  OtherView.swift
//  StarBucks
//
//  Created by 한소희 on 1/23/26.
//

import SwiftUI

struct OtherView: View {
//    init() {
//        UITableView.appearance().backgroundColor = .systemBackground
//    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(SettingMenu.allCases) { section in
                    Section(header: Text(section.title)) {
                        ForEach(section.menu, id: \.hashValue) { raw in
                            NavigationLink(raw, destination: Text(raw))
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle()) // 안한게 동글동글해서 귀여운듯 iOS 26에선
            .navigationTitle("Other")
            .toolbar {
                NavigationLink(destination: SettingView(), label: {
                    Image(systemName: "gear")
                })
            }
        }
    }
}

#Preview {
    OtherView()
}
