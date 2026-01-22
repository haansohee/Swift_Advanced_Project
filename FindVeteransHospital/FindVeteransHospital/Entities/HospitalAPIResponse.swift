//
//  HospitalAPIResponse.swift
//  FindVeteransHospital
//
//  Created by 한소희 on 1/20/26.
//

import Foundation

struct HospitalAPIResponse: Decodable {
    let data: [Hospital]
}
