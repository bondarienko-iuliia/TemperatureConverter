//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Iuliia Bondarenko on 03.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State var celsius: Double = 0
    @State var fahrenheit:Double = 0{
    didSet{
       
    }
}
    @State var kelvin:Double = 0{
        didSet{
            
        }
    }
    
    
    var body: some View {
      
        Form{
        Section{
            TextField("Celsius", value: $celsius, format: .number )
                .onChange(of: celsius, perform: {
                    fahrenheit = $0 * 32
                    kelvin = $0 + 273.15                })
        }header:{Text("Celsius")}
        Section{
            TextField("Fahrenheit", value:$fahrenheit, format:.number)
                .keyboardType(.decimalPad)
            .onChange(of: fahrenheit, perform: {
                 celsius = $0 / 32
                  kelvin = ($0 - 32) * (5/9) + 273.15  })
        }header:{Text("Fahrenheit")}
        Section{
            TextField("Kelvin", value:$kelvin, format:.number)
                .keyboardType(.decimalPad)
               .onChange(of: kelvin, perform: {
                fahrenheit = ($0-273.15) * (9/5) + 32
                celsius = $0 - 273.15})
        }header:{Text("Kelvin")}
            
        }
    
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
