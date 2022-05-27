//
//  BSListCell.swift
//  BikeStationsIOS
//
//  Created by Anoop on 5/26/22.
//

import SwiftUI

struct BSListCell: View {

    let feature: Feature
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text(feature.properties.label)
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                Text("600m Bike Station")
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                
            }
            .padding(.leading, 25.0)
            
            
            
            HStack{
                Spacer()
                VStack{
                    Image("BikeImage")
                    Text("Available Bike")
                    
                    Text(feature.properties.bikes)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.green)
                    
                }
                .padding(.vertical, 15.0)
                Spacer()
                
                VStack{
                    Image("LockImage")
                    Text("Available Places")
                    
                    Text(feature.properties.free_racks)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                }
                .padding(.vertical, 15.0)
                Spacer()
            }
        }.frame(width: 375, height: 200)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
        
    }
}

struct BSListCell_Previews: PreviewProvider {
    static var previews: some View {
        BSListCell(feature: MockData.sampleFeatureIs)
    }
}
