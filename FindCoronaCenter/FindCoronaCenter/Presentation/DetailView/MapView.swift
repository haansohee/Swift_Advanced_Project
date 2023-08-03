//
//  MapView.swift
//  FindCoronaCenter
//
//  Created by 한소희 on 2023/08/03.
//

import SwiftUI
import MapKit

struct AnnotaionItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    var coordination: CLLocationCoordinate2D
    
    // mapView의 상태 표시
    @State private var region = MKCoordinateRegion()
    @State private var annotationItems = [AnnotaionItem]()
    
    var body: some View {
        Map(
            coordinateRegion: $region,
            annotationItems: [AnnotaionItem(coordinate: coordination)],
            annotationContent: {
                MapMarker(coordinate: $0.coordinate)
            }
        )
        .onAppear {
            setRegion(coordination)
            setAnnotaionItems(coordination)
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )
    }
    
    private func setAnnotaionItems(_ coordinate: CLLocationCoordinate2D) {
        annotationItems = [AnnotaionItem(coordinate: coordinate)]
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(id: 0, sido: .경기도, facility: "실내빙상장 앞", address: "경기도 뭐뭐시 뭐뭐구", lat: "37.404476", lon: "126.94122", centerType: .central, phoneNumber: "010-0000-0000")
        MapView(
            coordination: CLLocationCoordinate2D(
                latitude: CLLocationDegrees(center0.lat) ?? .zero,
                longitude: CLLocationDegrees(center0.lon) ?? .zero
            )
        )
    }
}
