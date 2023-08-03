//
//  SelectRegionView.swift
//  FindCoronaCenter
//
//  Created by 한소희 on 2023/08/03.
//

import SwiftUI

struct SelectRegionView: View {
    // 바라보는쪽: ObservedObject
    @ObservedObject var viewModel = SelectRegionViewModel()
    
    private var items: [GridItem] {
        Array(repeating: .init(.flexible(minimum: 80)), count: 2)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: items, spacing: 20) {
                    ForEach(Center.Sido.allCases, id: \.id) { sido in
                        let centers = viewModel.centers[sido] ?? []
                        NavigationLink(destination: CenterList(centers: centers)) {
                            SelectRigionItem(region: sido, count: centers.count)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("코로나19 예방 접종 센터")
            
        }
    }
}


struct SelectRegionView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SelectRegionViewModel()
        SelectRegionView(viewModel: viewModel)
    }
}
