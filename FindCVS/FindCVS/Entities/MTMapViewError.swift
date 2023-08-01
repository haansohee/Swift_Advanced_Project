//
//  MTMapViewError.swift
//  FindCVS
//
//  Created by 한소희 on 2023/08/01.
//

import Foundation

enum MTMapViewError: Error {
    case failedUpdatingCurrentLocation
    case loactionAuthorizationDenied
    
    var errorDescription: String {
        switch self {
        case .failedUpdatingCurrentLocation:
            return "현재 위치를 불러오지 못 했어요. 잠시 후 다시 시도해 주세요."
            
        case .loactionAuthorizationDenied:
            return "위치 정보를 비활성화하면 사용자의 현재 위치를 알 수 없어요."
        }
    }
}
