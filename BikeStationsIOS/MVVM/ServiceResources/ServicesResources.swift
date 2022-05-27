//
//  ServicesResources.swift
//  BikeStationsIOS
//
//  Created by Anoop on 5/27/22.
//

import Foundation

struct BikeStationList {
    func getBikeStationList(completion : @escaping (_ result : BikeStationModel) -> Void ) {
        let httpUtility = APIServiceGet()
        let bikeStationListURL = URL(string: BikeStationListURL)!
        let urlRequest = URLRequest(url: bikeStationListURL)
        httpUtility.getApiData(requestUrl: urlRequest, resultType: BikeStationModel.self) { (cityListResponse) in
            _ = completion(cityListResponse!)
        }
    }
}
