//
//  ContentView.swift
//  FuelCostCalc
//
//  Created by Yeabsera Damte on 10/24/24.
//

//Programmer: Yeabsera Damte
//Date: 10/24/2024
//Xcode (Version 16.0)
//macOS Sequoia 15.0.1
//Description: This app is an interactive application, that calculates the total cost of fuel for a given trip.
//The user can input the total distance of the trip, the cost of fuel per gallon, and the fuel efficency of their vehicle

import SwiftUI

struct ContentView: View {
    
    @State private var travelDistace: String = ""
    @State private var priceOfFuel: String = ""
    @State private var vehicleFuelEfficiency: Double = 25.0
    @State private var cummulativeFuelCost: Double = 0.0
    
    
    var body: some View {
        ZStack{
            Image("background1")
                .resizable()
                .scaledToFill()
            //.edgesIgnoringSafeArea(.all))
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                Text("Fuel Cost Calculator")
                    .font(.largeTitle)
                    .bold()
                
                TextField("Enter ditance of trip (miles)", text: $travelDistace)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal, 40)
                
                TextField("Enter Fuel Cost (USD per gallon)", text: $priceOfFuel)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal, 40)
                
                VStack {
                    Text("Vehicle Fuel Efficency:")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        //.shadow(color: .black, radius: 2, x: 1, y: 1)
                    Text( "\(vehicleFuelEfficiency, specifier: "%.1f") mpg")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Slider(value: $vehicleFuelEfficiency, in: 5...50, step: 0.5)
                        .padding()
                        .padding(.horizontal, 40)
                        .frame(height: 20)
                }
                
                Button(action: calcFuelCost){
                    Text("Calculate Vehicle Fuel Cost")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                
                Text("Total Fuel Cost: $\(cummulativeFuelCost, specifier: "%.2f")")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                
            }
        }

    }
    
    func calcFuelCost(){
        guard let distVal = Double(travelDistace),
              let fuelCostVal = Double(priceOfFuel) else {
            cummulativeFuelCost = 0.0
            return
        }
        
        cummulativeFuelCost = (distVal / vehicleFuelEfficiency) * fuelCostVal
              
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 #Preview {
 ContentView()
 }
 */
