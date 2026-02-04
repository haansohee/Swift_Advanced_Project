//
//  TranslateView.swift
//  Translate
//
//  Created by 한소희 on 1/24/26.
//

import SwiftUI

struct TranslateView: View {
    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground)
                .ignoresSafeArea()
            VStack(spacing: 16) {
                LanguageButtonView()
                SourceTextBaseView()
            }
            .padding()
        }
    }
}

#Preview {
    TranslateView()
}
