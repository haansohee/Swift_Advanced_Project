//
//  Event.swift
//  StarBucks
//
//  Created by 한소희 on 1/22/26.
//

import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    
    let image: Image
    let title: String
    let description: String
}
