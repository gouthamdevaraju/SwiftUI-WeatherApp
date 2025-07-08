//
//  WeatherButtonView.swift
//  SwiftUI-Weather-App
//
//  Created by Goutham Devaraju on 07/07/25.
//

import SwiftUI

struct WeatherButtonView: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        
        Text(title)
            .frame(width: 280, height: 50)
            .font(.system(size: 20, weight: .bold, design: .default  ))
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}

struct WeatherButtonView_preview: PreviewProvider {
    static var previews: some View {
        WeatherButtonView(title: "Preview", textColor: .white, backgroundColor: .blue)
    }
}
