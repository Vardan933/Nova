![Swift](https://img.shields.io/badge/Swift-5.9-F54A2A?style=for-the-badge&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-blue?style=for-the-badge&logo=swift&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-17%2B-000000?style=for-the-badge&logo=apple&logoColor=white)
![Architecture](https://img.shields.io/badge/Architecture-MVVM-purple?style=for-the-badge)
![Async](https://img.shields.io/badge/Async-Await-green?style=for-the-badge)
![REST](https://img.shields.io/badge/API-REST-orange?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)

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
