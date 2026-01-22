//
//  MapView.swift
//  FindVeteransHospital
//
//  Created by 한소희 on 1/22/26.
//

import SwiftUI
import MapKit

struct AnnotationItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    var coordination: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    @State private var annotationItems = [AnnotationItem]()
    var body: some View {
//        Map(
//            coordinateRegion: $region,
//            annotationItems: [AnnotationItem(coordinate: coordination)],
//            annotationContent: {
//                MapMarker(coordinate: $0.coordinate)
//            }
//        )
//        .onAppear {
//            setRegion(coordination)
//            setAnnotationItems(coordination)
//        }
        Map(position: .constant(.region(region))) {
            Marker("hospital", coordinate: coordination)
        }
        .onAppear {
            setRegion(coordination)
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
    
//    private func setAnnotationItems(_ coordinate: CLLocationCoordinate2D) {
//        annotationItems = [AnnotationItem(coordinate: coordinate)]
//    }
}

#Preview {
    let hospital0 = Hospital(
        pid: 0,
        region_small: .강원,
        name: "강원병원",
        addr2: "강원도 뫄뫄 뫄뫄",
        latitude: "37.404476",
        longitude: "126.96123",
        tel: "010-00000-0000"
    )
    MapView(coordination: CLLocationCoordinate2D(
        latitude: CLLocationDegrees(hospital0.latitude) ?? 0,
        longitude: CLLocationDegrees(hospital0.longitude) ?? 0)
    )
}
