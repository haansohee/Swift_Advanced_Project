//
//  SelectRegionViewModel.swift
//  FindCoronaCenter
//
//  Created by 한소희 on 2023/08/03.
//

import Foundation
import Combine

class SelectRegionViewModel: ObservableObject {  // 외부에서 바라볼 수 있는 오브젝트
    // @Published를 이용해서 어떤 객체를 내보낼 것인지 표현하기
    @Published var centers = [Center.Sido: [Center]]()
    private var cancellables = Set<AnyCancellable>()
    
    init(centerNetwork: CenterNetwork = CenterNetwork()) {
        // 네트워크 통신을 통해서 여러 접종센터 받아오도록
        centerNetwork.getCenterList()
            .receive(on: DispatchQueue.main)  // 뷰에 뿌려져야 하기 때문에 mainThread에 뿌려지도록
            .sink(
                receiveCompletion: { [weak self] in
                    guard case .failure(let error) = $0 else { return }
                    print(error.localizedDescription)
                    self?.centers = [Center.Sido: [Center]]()
                },
                receiveValue: { [weak self] centers in
                    self?.centers = Dictionary(grouping: centers) { $0.sido }  // 받은 것의 sido로 그룹핑
                }
            )
            .store(in: &cancellables)  // disposed(by: disposeBag)
    }
}
