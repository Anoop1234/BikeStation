//
//  BSDView.swift
//  BikeStationsIOS
//
//  Created by Anoop on 5/27/22.
//

import SwiftUI
import MapKit

struct LocationData: Identifiable {
  let id = UUID()
  var name: String
  var coordinate: CLLocationCoordinate2D
}

struct BSDView: View {

    @State var tracking : MapUserTrackingMode = .none

   @State var manager = CLLocationManager()

   @StateObject var managerDelegate = LocationManager()

    let feature: Feature
    var body: some View {
        Map(
            coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: feature.geometry.coordinates[0], longitude:feature.geometry.coordinates[1]), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))),
            interactionModes: MapInteractionModes.all,
            showsUserLocation: true,
            userTrackingMode: $tracking, annotationItems: [LocationData(name: feature.properties.label, coordinate: CLLocationCoordinate2D(latitude: feature.geometry.coordinates[0], longitude:feature.geometry.coordinates[1]))]) {
            MapPin(coordinate: $0.coordinate)
        }
        BSListCell(feature: feature)
    }
}

struct BSDView_Previews: PreviewProvider {
    static var previews: some View {
        BSDView(feature: MockData.sampleFeatureIs)
    }
}
