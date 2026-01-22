//
//  SelectRegionView.swift
//  FindVeteransHospital
//
//  Created by 한소희 on 1/22/26.
//

import SwiftUI

struct SelectRegionView: View {
    @ObservedObject var viewModel = SelectRegionViewModel()

    private var items: [GridItem] {
        Array(repeating: .init(.flexible(minimum: 80)), count: 2)
    }

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: items, spacing: 20) {
                    ForEach(Hospital.RegionSmall.allCases, id: \.id) { sido in
                        let hospitals = viewModel.hospitals[sido] ?? []
                        NavigationLink(destination: HospitalList(hospitals: hospitals)) {
                            SelectRegionItem(region: sido, count: hospitals.count)
                        }
                    }
                }
                .padding()
                .navigationTitle("보훈병원 위탁병원 정보")
            }
        }
    }
}

#Preview {
    let viewModel = SelectRegionViewModel()
    SelectRegionView(viewModel: viewModel)
}
