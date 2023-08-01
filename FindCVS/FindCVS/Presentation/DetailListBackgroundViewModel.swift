//
//  DetailListBackgroundViewModel.swift
//  FindCVS
//
//  Created by 한소희 on 2023/08/01.
//

import RxSwift
import RxCocoa

struct DetailListBackgroundViewModel {
    // viewModel -> view 로 전달될 값
    let isStatusLabelHidden: Signal<Bool>
    
    // 외부에서 전달받을 값
    let shouldHideStatusLabel = PublishSubject<Bool>()
    
    init() {
        isStatusLabelHidden = shouldHideStatusLabel
            .asSignal(onErrorJustReturn: true)
    }
}
