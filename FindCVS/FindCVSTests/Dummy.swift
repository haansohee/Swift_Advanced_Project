//
//  Dummy.swift
//  FindCVSTests
//
//  Created by 한소희 on 2023/08/02.
//

import Foundation

@testable import FindCVS

var cvsList: [KLDocument] = Dummy().load("networkDummy.json")

class Dummy {
    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        let bundle = Bundle(for: type(of: self))
        
        guard let file = bundle.url(forResource: filename, withExtension: nil) else {
            fatalError("\(filename)을 main bundle에서 불러올 수 없습니다.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("\(filename)을 main bundle에서 불러올 수 없습니다. \(error.localizedDescription)")
        }
        
        do {
            let decoder = JSONDecoder().decode(T.self, from: data)
        } catch {
            fatalError("\(filename)을 \(T.self)로 파싱 할 수 없습니다. ")
        }
    }
}
