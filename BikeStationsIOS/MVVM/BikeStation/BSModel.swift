//
//  BSModel.swift
//  BikeStationsIOS
//
//  Created by Anoop on 5/27/22.
//

import Foundation

// MARK: - BikeStationModel
struct BikeStationModel: Decodable {
    let features: [Feature]
    let crs: CRS
    let type: String
}

// MARK: - CRS
struct CRS: Decodable {
    let type: String
    let properties: CRSProperties
}

// MARK: - CRSProperties
struct CRSProperties: Decodable {
    let code: String
}

// MARK: - Feature
struct Feature: Decodable {
    let geometry: Geometry
    let id: String
    let type: String
    let properties: FeatureProperties
}

// MARK: - Geometry
struct Geometry: Decodable {
    let coordinates: [Double]
    let type: String
}

enum GeometryType: String, Codable {
    case point = "Point"
}

// MARK: - FeatureProperties
struct FeatureProperties: Decodable {
    let free_racks, bikes, label, bike_racks: String
    let updated: String
}

struct MockData {
   static let sampleFeatureIs = Feature(geometry: Geometry(coordinates: [22.22,22.22], type: "Sample"), id: "Sample", type: "String", properties: FeatureProperties(free_racks: "String", bikes: "String", label: "String", bike_racks: "String", updated: "String"))
}

