//
//  LanguageButtonView.swift
//  Translate
//
//  Created by 한소희 on 1/24/26.
//

import SwiftUI

struct LanguageButtonView: View {
    @StateObject private var translateViewModel = TranslateViewModel()
    @State private var showingSourceLanguages = false
    @State private var showingTargetLanguages = false
    
    var body: some View {
        HStack(spacing: 10) {
            //MARK: Source Button
            Button(action: {
                showingSourceLanguages = true
            }) {
                Text("\(translateViewModel.sourceLanguage.title)")
                    .font(.system(size: 20.0, weight: .semibold))
                    .foregroundColor(.black)
            }
            .confirmationDialog("언어", isPresented: $showingSourceLanguages) {
                ForEach(AppLanguage.allCases, id: \.id) { language in
                    Button(language.title, role: .confirm) {
                        translateViewModel.setSourceLanguage(language)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .cornerRadius(9)

            //MARK: Target Button
            Button(action: {
                showingTargetLanguages = true
            }) {
                Text("\(translateViewModel.targetLanguage.title)")
                    .font(.system(size: 20.0, weight: .semibold))
                    .foregroundColor(.black)
            }
            .confirmationDialog("언어", isPresented: $showingTargetLanguages) {
                ForEach(AppLanguage.allCases, id: \.id) { language in
                    Button(language.title, role: .confirm) {
                        translateViewModel.setTargetLanguage(language)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .cornerRadius(9)
       
        }
        .frame(height: 60)
        .background(Color(UIColor.secondarySystemBackground))
        .padding(.horizontal, 16)
    }
}

#Preview {
    LanguageButtonView()
}
