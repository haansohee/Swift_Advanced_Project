//
//  Hospital.swift
//  FindVeteransHospital
//
//  Created by 한소희 on 1/20/26.
//

import Foundation
import CoreLocation

struct Hospital: Hashable, Decodable {
    let pid: Int
    let region_small: RegionSmall
    let name: String
    let addr2: String
    let latitude: String
    let longitude: String
    let tel: String
    
    enum RegionSmall: String, Decodable, CaseIterable, Identifiable {
        case 서울
        case 부산
        case 대구
        case 인천
        case 광주
        case 대전
        case 울산
        case 세종
        case 경기
        case 강원
        case 충북
        case 충남
        case 전북
        case 전남
        case 경북
        case 경남
        case 제주
        
        var id: String {
            return self.rawValue
        }
    }
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: CLLocationDegrees(self.latitude) ?? .zero,
            longitude: CLLocationDegrees(self.longitude) ?? .zero
        )
    }
}
