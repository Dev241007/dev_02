🐉 Game of Thrones & House of the Dragon Companion App

A comprehensive Game of Thrones (GoT) and House of the Dragon (HotD) companion application built with Flutter and Firebase, delivering rich lore, detailed house histories, dragons, legends, and family trees — all powered by real-time cloud data.

This project is designed as a scalable lore encyclopedia and a portfolio-grade Flutter application, showcasing real-world Firebase integration and clean app structure.

✨ Features

🏰 Westeros Houses

Detailed information on major and minor houses

Separate content for Game of Thrones and House of the Dragon eras

Fully dynamic data from Firebase Realtime Database


👑 Targaryen Dynasty

In-depth dynasty and lineage details

Historical context across timelines


🐲 Dragons

Dragon listings with detailed profiles

History, riders, and significance


📜 Legends & Lore

Mythical stories, prophecies, and historical events

Dedicated legend detail screens for deep reading


🌳 Family Trees

House family trees and lineage visualization

Structured and easy-to-follow hierarchy


🗺️ Westeros Map

Dedicated map screen for world navigation context


🔐 User Authentication

Secure login & signup using Firebase Authentication

Forgot password support

Ready for user-based features like favorites and personalization


🛠️ Tech Stack

Framework: Flutter

Backend: Firebase Realtime Database

Authentication: Firebase Authentication

Architecture: Feature & screen-based modular structure

Platform: Android (iOS-ready)


☁️ Real-Time Data Architecture

Firebase Realtime Database is the single source of truth

All content is fetched dynamically

No hardcoded or local static data

Content updates do not require app redeployment

Ensures scalability, flexibility, and consistency


📁 Project Structure (lib/)

The app follows a clean, feature-oriented structure to improve maintainability and scalability.

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


🧠 Architecture Overview

Auth module handles user authentication separately

HomeScreen modules organize content by feature (Houses, Dragons, Legends)

DrawerHeader screens manage secondary navigation pages

UI folder contains shared UI and navigation logic

main.dart initializes Firebase and application routing

This structure ensures:

Clear separation of concerns

Easy feature expansion

Clean navigation flow

Production-ready organization


🎯 Purpose & Vision

The goal of this app is to create a single trusted lore hub for the world of Westeros that is:

Fully cloud-driven

Content-rich and well-organized

Easy to scale and maintain

Built using real-world Flutter & Firebase practices

It also serves as a strong portfolio project for Flutter developer roles.


🚀 Future Enhancements

⭐ Auth-based favorites & bookmarks

🔍 Global search across all content

🕰️ Interactive timeline view

🌐 Multi-language support

🎨 Advanced UI animations and transitions


🤝 Contributing

Contributions are welcome!
Feel free to fork the repository, open issues, or submit pull requests.


📜 Disclaimer

This is a fan-made, non-commercial project.
All characters, names, and related content belong to HBO and George R. R. Martin.
Created strictly for educational and portfolio purposes.


👨‍💻 Author

Devendra Jethva
Flutter Developer | App Developer
📌 Focused on building scalable, real-time Flutter applications
