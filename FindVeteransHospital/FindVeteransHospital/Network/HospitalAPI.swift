//
//  HospitalAPI.swift
//  FindVeteransHospital
//
//  Created by 한소희 on 1/20/26.
//

import Foundation

struct HospitalAPI {
    static let scheme = "https"
    static let host = "api.odcloud.kr"
    static let path = "/api/witak2/v1/witak2"
    
    func getHospitalListComponents() -> URLComponents {
        var components = URLComponents()
        
        components.scheme = HospitalAPI.scheme
        components.host = HospitalAPI.host
        components.path = HospitalAPI.path
        
        components.queryItems = [
            URLQueryItem(name: "perPage", value: "300")
        ]
        
        return components
    }
}
