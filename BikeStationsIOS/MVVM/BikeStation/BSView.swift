//
//  BSView.swift
//  BikeStationsIOS
//
//  Created by Anoop on 5/27/22.
//

import SwiftUI

struct BSView: View {
    
    @StateObject private var viewModel = BSModelView()
    
    var body: some View {
        
        ZStack {
            NavigationView {
                List(viewModel.featureModels, id: \.id) {
                    feature in
                    NavigationLink(
                        destination: BSDView(feature: feature)){
                        BSListCell(feature: feature)

                    }
                }
                .navigationTitle("Bike Stations")
            }
            .onAppear { viewModel.getBikeStationList()            }
        }
    }
}

struct BSView_Previews: PreviewProvider {
    static var previews: some View {
        BSView()
    }
}
