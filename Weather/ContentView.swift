//
//  ContentView.swift
//  Weather
//
//  Created by Aknar Assanov on 12.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Astana")
                MainWeatherStatusView(imageName: isNight ? "moon.fill" : "cloud.sun.fill", temperature: isNight ? 15 : 25)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: isNight ? "moon.fill" : "cloud.sun.fill", temperature: 21)
                    WeatherDayView(dayOfWeek: "WED", imageName: isNight ? "cloud.moon.rain.fill" : "cloud.sun.rain.fill", temperature: 29)
                    WeatherDayView(dayOfWeek: "THU", imageName: isNight ? "cloud.moon.fill" : "sun.max.fill", temperature: isNight ? 20 : 30)
                    WeatherDayView(dayOfWeek: "FRI", imageName: isNight ? "moon.stars.fill" : "smoke.fill", temperature: 23)
                    WeatherDayView(dayOfWeek: "SAT", imageName: isNight ? "wind.snow" : "wind", temperature: 18)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Time of Day", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
   
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


