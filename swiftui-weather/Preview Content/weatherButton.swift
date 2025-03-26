//
//  weatherButton.swift
//  swiftui-weather
//
//  Created by Simarjeet Kaur on 27/03/25.
//
import SwiftUI

struct weatherButton :View{
    var buttonText: String
    var backgroundColor: Color
    var textColor: Color
    var body: some View{
        Text(buttonText)
            .frame(width: 330,height:50)
            .font(.system(size: 25,weight:.bold))
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}
