//
//  CenterDetailView.swift
//  FindCoronaCenter
//
//  Created by 한소희 on 2023/08/03.
//

import SwiftUI
import MapKit

struct CenterDetailView: View {
    var center: Center 
    
    var body: some View {
        VStack {
            MapView(coordination: center.coordinate)
                .ignoresSafeArea(edges: .all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            CenterRow(center: center)
        }
        .navigationTitle(center.facility)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CenterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(id: 0, sido: .경기도, facility: "실내빙상장 앞", address: "경기도 뭐뭐시 뭐뭐구", lat: "37.404476", lon: "126.94122", centerType: .central, phoneNumber: "010-0000-0000")
        
        CenterDetailView(center: center0)
    }
}
