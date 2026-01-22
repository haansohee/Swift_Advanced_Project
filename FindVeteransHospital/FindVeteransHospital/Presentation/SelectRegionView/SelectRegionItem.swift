//
//  SelectRegionItem.swift
//  FindVeteransHospital
//
//  Created by 한소희 on 1/22/26.
//

import SwiftUI

struct SelectRegionItem: View {
    var region: Hospital.RegionSmall
    var count: Int
    
    var body: some View {
        ZStack {
            Color(white: 0.9)
            VStack {
                Text(region.rawValue)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                Text("(\(count))")
                    .font(.callout)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            .padding()  // 자연스럽게 보이도록 패딩 추가
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    let region0 = Hospital.RegionSmall.경남
    SelectRegionItem(region: region0, count: 3)
}
