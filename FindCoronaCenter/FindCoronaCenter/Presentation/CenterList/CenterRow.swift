//
//  CenterRow.swift
//  FindCoronaCenter
//
//  Created by 한소희 on 2023/08/03.
//

import SwiftUI

struct CenterRow: View {
    var center: Center
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(center.facility)
                    .font(.headline)
                Text(center.centerType.rawValue)
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
            }
            Text(center.address)
                .font(.footnote)
            
            if let url = URL(string: "tel: " + center.phoneNumber) {
                Link(center.phoneNumber, destination: url)
            }
        }
        .padding()
    }
}

struct CenterRow_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(id: 0, sido: .경기도, facility: "실내빙상장 앞", address: "경기도 뭐뭐시 뭐뭐구", lat: "37.404476", lon: "126.94122", centerType: .central, phoneNumber: "010-0000-0000")
        CenterRow(center: center0)
    }
}
