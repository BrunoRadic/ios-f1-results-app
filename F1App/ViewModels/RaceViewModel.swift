
//  RaceViewModel.swift

import SwiftUI

class RaceViewModel: ObservableObject {
    @Published var raceTable: RaceTable?

    func loadRace() async throws {
        let firstResponse = try await fetchRaceData(0)
        let total = Int(firstResponse.MRData.total) ?? 0
        let limit = Int(firstResponse.MRData.limit) ?? 30
        
        var allRaces = firstResponse.MRData.RaceTable.Races
        
        var offset = limit
        while offset < total {
            let response = try await fetchRaceData(offset)
            allRaces.append(contentsOf: response.MRData.RaceTable.Races)
            offset += limit
        }
        
        let grouped = Dictionary(grouping: allRaces, by: { $0.round })
        let mergedRaces = grouped.values.compactMap{ races -> Race? in
            guard let first = races.first else { return nil }
            let mergedResults = races.flatMap { $0.Results }
            return Race (
                season: first.season,
                round: first.round,
                raceName: first.raceName,
                date: first.date,
                time: first.time,
                Results: mergedResults
            )
        }
        
        self.raceTable = RaceTable(Races: mergedRaces.sorted { Int($0.round)! < Int($1.round)!})
    }
}
