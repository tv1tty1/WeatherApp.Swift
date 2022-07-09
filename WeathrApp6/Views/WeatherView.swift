//
//  WeatherView.swift
//  WeathrApp6
//
//  Created by MacBook on 08.07.2022.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 10) {
                            Image(systemName: "cloud")
                                .font(.system(size: 60))
                            
                            Text("\(weather.weather[0].main)")
                        }
                        .frame(width: 90, alignment:  .bottomLeading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°C")
                            .font(.system(size: 95))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .padding(.all)
                        .frame(width: 0, height: 0)
                    
                    AsyncImage(url: URL(string: "https://avatars.mds.yandex.net/get-images-cbir/1574873/xsTJ5AqhQxgBW06N386GTA3838/ocr"))  { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + ("°C")))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°C"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.667, saturation: 0.766, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topRight, .topLeft])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.681, saturation: 3.086, brightness: 0.354))
        .preferredColorScheme(.dark)
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
