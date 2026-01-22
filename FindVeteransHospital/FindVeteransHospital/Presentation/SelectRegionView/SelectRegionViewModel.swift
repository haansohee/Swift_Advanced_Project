//
//  SelectRegionViewModel.swift
//  FindVeteransHospital
//
//  Created by 한소희 on 1/22/26.
//

import Foundation
import Combine

final class SelectRegionViewModel: ObservableObject {  // ObservableObject: 컴바인에서 제공하는 것. 외부에서 바라볼 수 있는 오브젝트다.. 뷰랑 연결될 때 사용함
    @Published var hospitals = [Hospital.RegionSmall: [Hospital]]() // 어떤 객체를 내보낼 것인지..
    private var cancellables = Set<AnyCancellable>()  // disposeBag과 같은 역할
    
    init(hospitalNetwork: HospitalNetwork = HospitalNetwork()) {
        hospitalNetwork.getHospitalList()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: {[weak self] in
                guard case .failure(let error) = $0 else { return }
                print(error.localizedDescription)
                self?.hospitals = [Hospital.RegionSmall: [Hospital]]()
            },
                  receiveValue: {[weak self] hospitals in
                self?.hospitals = Dictionary(grouping: hospitals) { $0.region_small }
            })
            .store(in: &cancellables)  // disposed(by: disposeBag)
    }
}
