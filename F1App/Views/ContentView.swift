
//  ContentView.swift


import SwiftUI

struct ContentView: View {
    @StateObject private var vm = RaceViewModel()
    var body: some View {
         
        
        NavigationStack {
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(vm.raceTable?.Races ?? [], id: \.round) { race in
                                NavigationLink {
                                    RaceDetailView(race: race, vm: vm)
                                } label: {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(race.raceName)
                                            .font(.headline)
                                            .foregroundColor(.red)
                                        
                                        HStack {
                                            Text("Round \(race.round)")
                                                .font(.subheadline)
                                                .foregroundColor(.white)
                                            Spacer()
                                            Text(race.date)
                                                .font(.subheadline)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(12)
                                    .shadow(color: .red.opacity(0.3), radius: 5, x: 0, y: 2)
                                }
                            }
                        }
                        .padding()
                    }
                    .background(Color.black.ignoresSafeArea())
                    .navigationTitle("F1 Grand Prix")
                    .navigationBarTitleDisplayMode(.inline)
                }
            .background(.black)
            .task {
                do{
                    try await vm.loadRace()
                } catch {
                   print("Couldn't load races.")
                }
            }
    }
    
}

#Preview {
    ContentView()
}
