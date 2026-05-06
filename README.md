![Swift](https://img.shields.io/badge/Swift-6.0-orange?style=flat-square&logo=swift)
![SwiftUI](https://img.shields.io/badge/SwiftUI-6.0-blue?style=flat-square&logo=swift)
![Platform](https://img.shields.io/badge/Platform-iOS-blue?style=flat-square&logo=apple)
![Architecture](https://img.shields.io/badge/Architecture-MVVM-green?style=flat-square)


# Nova 
**Nova** is a modern OS application for staying updated with the latest news. Built with a focus on deep engineering principles, clean architecture, and high performance.

## Tech Stack & Architecture
- **Language:** Swift 6.0
- **Framework:** SwiftUI
- **Architecture:** MVVM
- **Networking:** Native URLSession with Codable
- **Local Storage:** SwiftData (Planned)

## Key Features
- [ ] Real-time news feed using NewsAPI
- [ ] Category-based filtering
- [ ] Advanced search functionality
- [ ] Offline reading with local persistence
- [ ] Minimalist and responsive UI

## Project Structure
- `App/`: App Delegate and Root entry point.
- `Core/`: Networking, Utilities, and Extensions.
- `Features/`: Main app modules (Feed, Search, Saved).
- `Resources/`: Assets and Localizable strings.

## Setup
Since this project uses sensitive API keys, a `Secrets.plist` file is required in the `Resources` folder but is ignored by Git for security.
