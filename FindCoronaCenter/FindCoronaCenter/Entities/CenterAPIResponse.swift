//
//  CenterAPIResponse.swift
//  FindCoronaCenter
//
//  Created by 한소희 on 2023/08/03.
//

import Foundation

struct CenterAPIResponse: Decodable {
    let data: [Center]
}
