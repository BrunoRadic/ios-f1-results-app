//
//  RaceDetailView.swift
//  F1App
//
//  Created by Bruno Radić on 28.09.2025..
//

import SwiftUI

struct RaceDetailView: View {
    
    let race: Race
   
    
    @ObservedObject var vm: RaceViewModel
    
    var body: some View {
        ScrollView{
            
            
            VStack(alignment: .leading, spacing: 16) {
                
                Text(race.raceName)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .padding(.bottom, 8)

                Text("Season: \(race.season)")
                    .foregroundColor(.gray)
                Text("Round: \(race.round)")
                    .foregroundColor(.gray)
                Text("Date: \(race.date)")
                    .foregroundColor(.gray)
                Text("Time: \(race.time ?? "N/A")")
                    .foregroundColor(.gray)

                
                ForEach(race.Results, id: \.position) { result in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("#\(result.position)")
                                .font(.headline)
                                .foregroundColor(.red)
                                .frame(width: 40)

                            NavigationLink(
                                destination: DriverDetailView(driver: result.Driver, vm: vm)
                            ) {
                                Text("\(result.Driver.givenName) \(result.Driver.familyName)")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                            }

                            Spacer()

                            Text(result.Constructor.name)
                                .foregroundColor(.blue)
                                .italic()
                        }

                        Divider().background(Color.gray)

                        VStack(alignment: .leading, spacing: 4) {
                            Text("Laps: \(result.laps ?? "N/A")")
                            Text("Status: \(result.status)")
                            if let raceTime = result.Time?.time {
                                Text("Race Time: \(raceTime)")
                            }
                            if let fastestLap = result.FastestLap?.Time.time {
                                Text("Fastest Lap: \(fastestLap)")
                                    .foregroundColor(.green)
                                    .bold()
                            }
                            if let lap = result.FastestLap?.lap {
                                Text("Lap: \(lap)")
                            }
                            if let rank = result.FastestLap?.rank {
                                Text("Rank: \(rank)")
                            }
                        }
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.9))
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(12)
                    .shadow(color: .red.opacity(0.3), radius: 5, x: 0, y: 2)
                }
            }
            .padding()
            
        }
        .background(Color.black.ignoresSafeArea())
    }
}
