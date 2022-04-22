//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Iuliia Bondarenko on 03.04.2022.
//

import SwiftUI

struct TextFieldView: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(.regularMaterial)
            .cornerRadius(10)
            .foregroundColor(.gray)
        
    }
    
}
extension View{
    func beautifulTextField() -> some View{
        modifier(TextFieldView())
    }
}
struct ContentView: View {
    @State var celsius: Double = 0
    @State var fahrenheit:Double = 0
    @State var kelvin:Double = 0
    
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors:[
                Color(.systemBlue),
                Color(.systemPink)]), startPoint: .topLeading, endPoint: UnitPoint.bottomLeading)
            .ignoresSafeArea()
            
            VStack{
                
                Text("Celsius")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .foregroundColor(.white)
                TextField("Celsius", value: $celsius, format: .number )
                    .onChange(of: celsius, perform: {
                        fahrenheit = $0 * 32
                        kelvin = $0 + 273.15 })
                    .beautifulTextField()
                
                Text("Fahrenheit")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .foregroundColor(.white)
                TextField("Fahrenheit", value:$fahrenheit, format:.number)
                    .keyboardType(.decimalPad)
                    .onChange(of: fahrenheit, perform: {
                        celsius = $0 / 32
                        kelvin = ($0 - 32) * (5/9) + 273.15  })
                    .beautifulTextField()

                Text("Kelvin")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .foregroundColor(.white)
                TextField("Kelvin", value:$kelvin, format:.number)
                    .keyboardType(.decimalPad)
                    .onChange(of: kelvin, perform: {
                        fahrenheit = ($0-273.15) * (9/5) + 32
                        celsius = $0 - 273.15})
                    .beautifulTextField()
            }.padding()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
