//
//  WeatherButton.swift
//  Weather
//
//  Created by Aknar Assanov on 12.05.2022.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
            Text(title)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .cornerRadius(10)
                .font(.system(size: 20, weight: .bold, design: .default))
    }
} 
