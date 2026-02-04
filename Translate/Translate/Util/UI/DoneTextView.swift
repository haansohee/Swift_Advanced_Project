//
//  DoneTextView.swift
//  Translate
//
//  Created by 한소희 on 1/28/26.
//import Swift

import SwiftUI

struct DoneTextView: UIViewRepresentable {
    @Binding var text: String
    var onDone: (() -> Void)?
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 16)
        textView.isScrollEnabled = true
        textView.returnKeyType = .done
        textView.delegate = context.coordinator
        textView.backgroundColor = .clear
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UITextViewDelegate {
        let parent: DoneTextView
        
        init(_ parent: DoneTextView) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
        
        func textView(
            _ textView: UITextView,
            shouldChangeTextIn range: NSRange,
            replacementText text: String
        ) -> Bool {
            if text == "\n" {
                textView.resignFirstResponder()
                parent.onDone?()  // Done = submit
                return false  // 줄바꿈 막기
            }
            return true
        }
    }
}
