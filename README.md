# F1 Results Viewer 🏎️

A simple iOS app built with **SwiftUI** and **MVVM** that fetches Formula 1 race results from the [Jolpi Ergast API](https://api.jolpi.ca/ergast/).  

This project was created as preparation for an iOS internship interview, with the goal of practicing **JSON decoding, async/await networking, state management, and SwiftUI UI design**.

---

## ✨ Features
- Fetches all 2025 Formula 1 race results (with pagination handled automatically).  
- Displays a list of Grand Prix races.  
- Detailed race results with driver positions, constructor info, and fastest laps.  
- Driver detail screen with personal info.  
- Modern SwiftUI design with navigation and dark theme.  
- Organized into **Models / Network / ViewModels / Views** for clean structure.  

---

## 🛠️ Technologies
- Swift 5.9+  
- SwiftUI  
- Async/Await + URLSession  
- Codable for JSON decoding  
- MVVM architecture  

---

## 📂 Project Structure
F1ResultsViewer/
├── Models/          # Codable structs for API response
├── Network/         # API service + error handling
├── ViewModels/      # ObservableObject for race data
└── Views/           # SwiftUI screens (ContentView, RaceDetailView, DriverDetailView)

---

## 🚀 Getting Started
1. Clone this repo:
   ```bash
   git clone https://github.com/BrunoRadic/F1ResultsViewer.git
2.    Open the project in Xcode 16+.
3.    Build & run on Simulator or device.
