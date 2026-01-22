//
//  HospitalRow.swift
//  FindVeteransHospital
//
//  Created by 한소희 on 1/22/26.
//

import SwiftUI

struct HospitalRow: View {
    var hospital: Hospital
    
    var body: some View {
        VStack(alignment: .leading){
            Text(hospital.name)
                .font(.headline)
            Text(hospital.addr2)
                .font(.footnote)
            
            if let url = URL(string: "tel:" + hospital.tel) {
                Link(hospital.tel, destination: url)
            }
        }
        .padding()
    }
}

#Preview {
    let hospital0 = Hospital(pid: 0, region_small: .강원, name: "강원병원", addr2: "강원도 뫄뫄 뫄뫄", latitude: "37.404476", longitude: "126.96123", tel: "010-00000-0000")
    HospitalRow(hospital: hospital0)
}
