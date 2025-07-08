//
//  ContentView.swift
//  SwiftUI-Weather-App
//
//  Created by Goutham Devaraju on 07/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = false
    
    var body: some View {
        ZStack {
            // Full screen gradient background
            BackgroundView(isDark: $isNight)
            
            // Your content goes here
            VStack(spacing: 10) {
                
                CityView(cityName: "Hyderabad, India.")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 22, isNight: isNight)
                
                HStack(spacing: 20) {
                    
                    WeatherDayView(dayOfWeek: "SUN",
                                   weatherIcon: "cloud.sun.fill",
                                   temperature: 27)
                    
                    WeatherDayView(dayOfWeek: "MON",
                                   weatherIcon: "sun.max.fill",
                                   temperature: 32)
                    
                    WeatherDayView(dayOfWeek: "TUE",
                                   weatherIcon: "wind.snow",
                                   temperature: 28)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   weatherIcon: "sunset.fill",
                                   temperature: 29)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   weatherIcon: "snow",
                                   temperature: 30)
                    
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButtonView(title: "Change Day Time", textColor: isNight ? .white : .blue, backgroundColor: isNight ? .gray : .white)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var weatherIcon: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default  ))
                .foregroundColor(.white)
            VStack {
                Image(systemName: weatherIcon)
                    .symbolRenderingMode(.palette)
                    .resizable()
                    .foregroundStyle(.white, .orange)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("\(temperature)°")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.white)
            }
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isDark: Bool
    
    var body: some View {
//        LinearGradient(
//            gradient: Gradient(colors: [isDark ? .black : .blue, isDark ? .gray : Color.backgroundColorTwo]),
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing
//        )
//        .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isDark ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
        
    }
}

struct CityView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default  ))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    var isNight: Bool
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(isNight ? .white : .orange, isNight ? .orange : .white)
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
                .padding()
            Text("\(temperature)°")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
        }
        .padding(.bottom, 40)
    }
}


