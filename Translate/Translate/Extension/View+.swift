//
//  View+.swift
//  Translate
//
//  Created by 한소희 on 2/5/26.
//

import SwiftUI

extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
