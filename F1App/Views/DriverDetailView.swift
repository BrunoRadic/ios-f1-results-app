//
//  ContentView.swift
//  F1App
//
//  Created by Bruno Radić on 28.09.2025..
//

import SwiftUI

struct DriverDetailView: View{
    let driver: Driver
    
    @ObservedObject var vm: RaceViewModel
    
    var body: some View{
        
        ZStack{
            Color.black.ignoresSafeArea()
            ScrollView{
                
                    Text("Driver details")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding(.bottom, 8)
                        Spacer()
                    VStack(alignment: .leading, spacing: 8){
                        Text("\(driver.givenName) \(driver.familyName)")
                            .fontWeight(.semibold)
                            .font(.headline)
                        Text("Nationality: \(driver.nationality)")
                            .font(.footnote)
                        Text("Number: \(driver.permanentNumber)")
                            .font(.footnote)
                        Text("Date of birth: \(driver.dateOfBirth)")
                            .font(.footnote)
                        (Text(driver.code).padding(4).background(Color.red).cornerRadius(6))
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(12)
                    .shadow(color: .red.opacity(0.3), radius: 5, x: 0, y: 2)
                
                .foregroundStyle(.white)
            }
            
        }
        
    }
    
}
