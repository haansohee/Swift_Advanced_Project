//
//  HospitalList.swift
//  FindVeteransHospital
//
//  Created by 한소희 on 1/22/26.
//

import SwiftUI

struct HospitalList: View {
    var hospitals = [Hospital]()
    
    var body: some View {
        List(hospitals, id: \.pid) { hospital in
            NavigationLink(destination: HospitalDetailView(hospital: hospital)) {
                HospitalRow(hospital: hospital)
            }
            .navigationTitle(hospital.region_small.rawValue)
        }
    }
}

#Preview {
    let hospitals = [
        Hospital(pid: 0, region_small: .전남, name: "강진의료원", addr2: "전남 강진군 강진읍 탐진로 5", latitude: "34.6372553", longitude: "126.7574570", tel: "061-4332-1679"),
        Hospital(pid: 1, region_small: .서울, name: "메디힐병원", addr2: "서울시 양천구 남부순환로 311 (신월동)", latitude: "37.5373069", longitude: "126.8277244", tel: "02-2690-7575"),
        Hospital(pid: 2, region_small: .인천, name: "인천광역시의료원 백령병원", addr2: "인천시 응진군 백령면 백령로 233", latitude: "37.9728415", longitude: "124.7182710", tel: "032-836-1731")
    ]
    HospitalList(hospitals: hospitals)
}
