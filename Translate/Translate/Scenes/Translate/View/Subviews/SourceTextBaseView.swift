//
//  SourceTextBaseView.swift
//  Translate
//
//  Created by 한소희 on 1/24/26.
//

import SwiftUI
import Translation

struct SourceTextBaseView: View {
    @ObservedObject var translateViewModel: TranslateViewModel
    @State private var showModal = false
    @State private var inputText: String = ""
    @State private var configuration: TranslationSession.Configuration?
    
    var body: some View {
        // MARK: Translate Result
        VStack(spacing: 5.0) {
            Text(translateViewModel.translationResultText.isEmpty ? "번역 결과" : "\(translateViewModel.translationResultText)")
                .font(.system(size: 24.0, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .foregroundColor(Color(UIColor.mainTintColor))
                .background(.white)
            
            HStack {
                Button(action: {
                    translateViewModel.didTapBookmarkButton(translateViewModel.bookmarkImageName)
                },
                       label: { Image(systemName: translateViewModel.bookmarkImageName.imageName)
                        .font(.system(size: 22))
                })
                .frame(width: 40, height: 40)
                
                
                Button(action: {
                    translateViewModel.didTapCopyButton()
                },
                       label: { Image(systemName: ImageSystemName.copy.imageName)
                        .font(.system(size: 22))
                })
                .frame(width: 40, height: 40)
            }
            .accentColor(Color(UIColor.mainTintColor))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(22)
        .background(Color.white)
        .onTapGesture {
            endTextEditing()
        }
        
        // MARK: Translate Base View
        ZStack(alignment: .topLeading) {
            Color(UIColor.white)
                .ignoresSafeArea()
            TextField("문장을 입력해 보세요.", text: $inputText, axis: .vertical)
                .font(.system(size: 23, weight: .semibold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(22)
                .lineLimit(nil)
        }
        .onTapGesture {
            endTextEditing()
        }
        
        // MARK: Translate Button
        Button(action: {
            endTextEditing()
            translateViewModel.didEnterText(inputText)
            guard configuration == nil else {
                configuration?.invalidate()
                return
            }
            configuration = TranslationSession.Configuration(
                source: translateViewModel.sourceLanguage.translationLanguage,
                target: translateViewModel.targetLanguage.translationLanguage
            )
        }) {
            Text("번역하기")
                .font(.system(size: 20.0, weight: .semibold))
                .foregroundColor(.black)
        }
        .background(.white)
        .frame(maxWidth: 100, maxHeight: 50)
        .background(.white)
        .cornerRadius(9)
        .translationTask(configuration) { session in
            do {
                let response = try await session.translate(translateViewModel.sourceText)
                translateViewModel.setTargetTextResult(response.targetText)
            } catch {
                print("error: \(error.localizedDescription)")
            }
        }
    }
}
