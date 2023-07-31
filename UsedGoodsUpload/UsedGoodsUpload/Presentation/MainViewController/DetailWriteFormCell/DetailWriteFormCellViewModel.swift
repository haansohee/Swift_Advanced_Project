//
//  DetailWriteFormCellViewModel.swift
//  UsedGoodsUpload
//
//  Created by 한소희 on 2023/07/31.
//

import RxSwift
import RxCocoa

struct DetailWriteFormCellViewModel {
    // View -> ViewModel
    let contentValue = PublishRelay<String?>()
}
