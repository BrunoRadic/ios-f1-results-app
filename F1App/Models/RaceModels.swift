//
//  RaceModels.swift
//  F1App
//
//  Created by Bruno Radić on 28.09.2025..
//

import Foundation


struct JolpiResponse: Codable{
    let MRData: MRData
}

struct MRData: Codable{
    let RaceTable: RaceTable
    let limit: String
    let total: String
    let offset: String
}
struct RaceTable: Codable{
    let Races: [Race]
}

struct Race: Codable{
    let season: String
    let round: String
    let raceName: String
    let date: String
    let time: String?
    let Results: [Result]
}

struct Result: Codable{
    let position: String
    let Driver: Driver
    let Constructor: Constructor
    let grid: String?
    let laps: String?
    let status: String
    let Time: TimeRecord?
    let FastestLap: FastestLap?
}

struct Driver: Codable{
    let permanentNumber: String
    let givenName: String
    let familyName: String
    let nationality: String
    let dateOfBirth: String
    let code: String
}

struct Constructor: Codable{
    let name: String
    let nationality: String
}

struct TimeRecord: Codable{
    let millis: String?
    let time: String
}

struct FastestLap: Codable{
    let rank: String
    let lap: String
    let Time: TimeRecord
}

