//
//  LocationInformationTests.swift
//  FindCVSTests
//
//  Created by 한소희 on 2023/08/02.
//

import XCTest
import Nimble

@testable import FindCVS

class LocationInformationTests: XCTestCase {
    let stubNetwork LocalNetworkStub()
    
    var doc: [KLDocument]!
    var model: LocationInformationModel!
    
    override class func setUp() {
        self.model = LocationInformationModel(localNetwork: stubNetwork)
        
        self.doc = cvsList
    }
    
    func testDocumentsToCellData() {
        let cellData = model.documentsToCellData(doc)  // 실제 모델의 값
        let placeName = doc.map { $0.placeName }  // dummy의 값
        let address0 = cellData[1].address  // 실제 모델의 값
        let roadAddressName = doc[1].roadAddressName  // dummy의 값
        
        expect(cellData.map { $0.placeName }).to(
        equal(placeName),
        description: "DetailListCellData의 placeName은 document의 placeName이다."
        )
        
        expect(address0).to(
            equal(roadAddressName),
            description: "KLDocument의 RoadAddressName이 빈 값이 아닐 경우 roadAddress가 cellData에 전달된다."
        )
    }
}
