//
//  BSDModel.swift
//  BikeStationsIOS
//
//  Created by Anoop on 5/27/22.
//

import Foundation
import MapKit

struct Place: Identifiable {
  let id = UUID()
  var name: String
  var coordinate: CLLocationCoordinate2D
}
