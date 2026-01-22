//
//  HospitalDetailView.swift
//  FindVeteransHospital
//
//  Created by 한소희 on 1/22/26.
//

import SwiftUI
import MapKit

struct HospitalDetailView: View {
    var hospital: Hospital
    var body: some View {
        VStack {
            MapView(coordination: hospital.coordinate)
                .ignoresSafeArea(edges: .all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            HospitalRow(hospital: hospital)
        }
        .navigationTitle(hospital.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let hospital0 = Hospital(pid: 0, region_small: .강원, name: "강원병원", addr2: "강원도 뫄뫄 뫄뫄", latitude: "37.404476", longitude: "126.96123", tel: "010-00000-0000")
    HospitalDetailView(hospital: hospital0)
}
