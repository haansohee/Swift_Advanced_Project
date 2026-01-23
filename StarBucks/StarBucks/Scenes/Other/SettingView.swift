//
//  SettingView.swift
//  StarBucks
//
//  Created by 한소희 on 1/23/26.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        List {
            Section {
                SettingUserInfoSectionView()
            }
            Button("회원 정보 수정") {}
                .accentColor(.black)
            Button("회원 탈퇴") {}
                .accentColor(.black)
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("설정")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingUserInfoSectionView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4.0) {
                Text(User.shared.userName)
                    .font(.title)
                Text(User.shared.account)
                    .font(.caption)
            }
            Spacer()
            Button(action: {}) {
                Text("로그아웃")
                    .accentColor(.green)
                    .font(.system(size: 14.0, weight: .bold, design: .default))
            }
            .padding(8.0)
            .overlay(Capsule().stroke(Color.green))
        }
    }
}

#Preview {
    SettingView()
}
