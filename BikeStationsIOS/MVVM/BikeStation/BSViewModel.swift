//
//  BSViewModel.swift
//  BikeStationsIOS
//
//  Created by Anoop on 5/27/22.
//

import Foundation


final class BSModelView : ObservableObject {
    
    @Published var featureModels : [Feature] = []
    
    func getBikeStationList() {
        let getStationList = BikeStationList()
        getStationList.getBikeStationList { (bikeStationModel) in
            DispatchQueue.main.async {
                self.featureModels = bikeStationModel.features
            }
        }
    }
}
