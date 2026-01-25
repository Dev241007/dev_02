🐉 Westeros — Game of Thrones & House of the Dragon Lore App
License: Flutter · Firebase

Westeros is a cloud-powered lore intelligence app that provides rich, structured, and real-time information about the world of Game of Thrones and House of the Dragon.

Built using Flutter + Firebase, the app delivers houses, dragons, legends, family trees, and historical content through a scalable, real-time architecture.

🌟 Overview
Westeros is designed as a complete lore companion for fans and a portfolio-grade Flutter project for developers.

It combines:

☁️ Firebase Realtime Database (single source of truth)
🔐 Firebase Authentication
📱 Modular Flutter UI architecture
🧠 What Westeros Does
✅ Provides detailed lore for Houses, Dragons, Legends, and Lineages
🏰 Separates timelines between Game of Thrones and House of the Dragon
🐲 Displays dragon histories and riders
🌳 Visualizes family trees and house relationships
📜 Centralizes legends and historical events
🔐 Secures access using Firebase Authentication
✨ Features
🏰 Houses of Westeros
Major and minor houses
Full historical descriptions
Dedicated detail screens
🐲 Dragons
Dragon profiles with history and significance
Timeline-based lore
📜 Legends & Lore
Mythical stories and major historical events
Clean reading-focused UI
🌳 Family Trees
House lineage and relationships
Structured family tree screens
🗺️ World Map
Westeros map screen for geographical context
🔐 Authentication
Login / Signup using Firebase Authentication
Forgot password support
Architecture ready for user-based features
🧰 Tech Stack
🔹 Frontend
Flutter
Dart
Modular screen-based architecture
🔹 Backend / Cloud
Firebase Realtime Database – all content storage
Firebase Authentication – user management
🔹 Architecture
Feature-based folder structure
Clean navigation flow
Scalable and maintainable design
☁️ Real-Time Data Architecture
Firebase Realtime Database is the only data source
No local or hardcoded content
Content updates do not require app updates
Enables scalability and centralized management
📁 Repository Structure
lib/
├── pages/
│   ├── Auth/
│   │   ├── login.dart
│   │   ├── signup.dart
│   │   └── forgate.dart
│   │
│   ├── HomeScreen/
│   │   ├── Dragons/
│   │   │   ├── Dragons_List.dart
│   │   │   └── DragonsDetailScreen.dart
│   │   │
│   │   ├── DrawerHeader/
│   │   │   ├── aboutScreen.dart
│   │   │   ├── FamilyTree.dart
│   │   │   ├── housesFamilytree.dart
│   │   │   └── Map.dart
│   │   │
│   │   ├── Houses/
│   │   │   ├── Houses_List.dart
│   │   │   └── HouseDetailScreen.dart
│   │   │
│   │   └── Legends/
│   │       ├── Legends_List.dart
│   │       └── LegendDetailScreen.dart
│   │
│   └── UI/
│       ├── colors.dart
│       ├── HousesPage.dart
│       ├── OnBoardingScreen.dart
│       ├── SplshScreen.dart
│       └── wrapper.dart
│
└── main.dart

---

## 🧩 Architecture Overview

- **Auth Module** → Handles authentication flow  
- **Feature Modules** → Houses, Dragons, Legends  
- **Drawer Screens** → Secondary navigation pages  
- **UI Layer** → Shared UI, themes, onboarding, splash  
- **Main Entry** → Firebase initialization & routing  

Designed for **clarity, scalability, and real-world usage**.

---

## ⚙️ Setup & Run

### 1️⃣ Clone Repository
```bash
git clone https://github.com/your-username/westeros.git
cd westeros


## 2️⃣ Firebase Configuration

- Create a Firebase project
- Enable:
  - Realtime Database
  - Firebase Authentication
- Add `google-services.json` to the Android app  

⚠️ **Keep Firebase config files private**

---

## 3️⃣ Run App

```bash
flutter pub get
flutter run

## 🔐 Security Notes

- Firebase rules protect data access
- No secrets stored in source code
- Authentication required for secured flows
- Config files should never be committed publicly

---

## 🧪 Testing

- Test authentication flows
- Verify real-time data updates
- Monitor Firebase logs for debugging
- Test on emulator and physical device

---

## 📌 Roadmap

- ⭐ Favorites & bookmarks (Auth-based)
- 🔍 Global search across lore
- 🕰️ Interactive timeline mode
- 🌐 Multi-language support
- 🎨 Advanced animations & transitions

---

## 🤝 Contributing

Contributions are welcome!

### Steps to Contribute
1. Fork the repository
2. Create a feature branch
3. Commit clean, readable code
4. Open a Pull Request

---

## 📜 Disclaimer

This is a **fan-made, non-commercial project**.  
All characters, names, and related content belong to **HBO** and **George R. R. Martin**.  
Created strictly for **educational and portfolio purposes**.

---

## 👨‍💻 Author

**Devendra Jethva**  
Flutter Developer | App Developer

---

## ⭐ Support This Project

If you like this project:

- ⭐ Star the repository  
- 🍴 Fork it  
- 🤝 Contribute  
- 📢 Share with fellow GoT fans  


📢 Share with fellow GoT fans
