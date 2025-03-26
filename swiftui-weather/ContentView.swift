//
//  ContentView.swift
//  swiftui-weather
//
//  Created by Simarjeet Kaur on 26/03/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isNightModeOn = false
    var body: some View {
        //        VStack {
        //            Image(systemName: "globe")
        //                .imageScale(.large)
        //                .foregroundStyle(.tint)
        //            Text("Hello, world!")
        //        }
        ZStack{
            backgroundView(color1: isNightModeOn ? .black: .blue, color2: isNightModeOn ? .gray:Color("lightblue"))
            VStack{
                cityTextView(cityName: "Cupertino,CA")
                mainWeatherView(imageName: isNightModeOn ? "moon.stars.fill":"cloud.sun.fill",temp:76)
                .padding(.bottom,110)
                HStack(spacing:20){
                    
                    weatherDayView(dayOfTheWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    weatherDayView(dayOfTheWeek: "WED", imageName: "sun.max.fill", temperature: 70)
                    weatherDayView(dayOfTheWeek: "THURS", imageName: "wind", temperature: 66)
                    weatherDayView(dayOfTheWeek: "FRI", imageName: "sunset.fill", temperature: 60)
                    weatherDayView(dayOfTheWeek: "SAT", imageName: "moon.stars.fill", temperature: 74)
                    
                }
                Spacer()
                
                Button {
                    isNightModeOn.toggle()
                }
                label: {
                    weatherButton(buttonText: "Change Day Time", backgroundColor: .white, textColor: .blue)
                }
                Spacer()
            }
        }
        
    }
}


#Preview {
    ContentView()
}

struct weatherDayView: View {
    var dayOfTheWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(){
            Text(dayOfTheWeek).foregroundColor(.white)
                .font(.system(size:16,weight:.medium))
            Image(systemName: imageName).renderingMode(.original).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:40,height:40 )
        Text("\(temperature)°").foregroundColor(.white).font(.system(size:28,weight:.medium))
            
        }
    }
}

struct backgroundView: View {
    var color1: Color
    var color2: Color
    var body : some View{
        LinearGradient(gradient:
                        Gradient(colors: [color1,color2]),
                        startPoint:.topLeading,
                        endPoint:.bottomTrailing)
                        .edgesIgnoringSafeArea(.all)

    }
}

struct cityTextView: View{
    var cityName: String
    var body: some View{
        Text(cityName)
        .font(.system(size:25,weight:.medium,design:.default))
        .foregroundColor(.white)
        .padding()
    }
}
struct mainWeatherView: View{
    var imageName: String
    var temp: Int
    var body: some View{
            VStack(spacing:10){
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:150,height:150 )
                Text("\(temp)°")
                    .font(.system(size: 55, weight:.medium,design:.default))
                    .foregroundColor(.white)
            }
    }
}

