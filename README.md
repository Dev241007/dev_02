# 🐉 Westeros — Game of Thrones & House of the Dragon Lore App

**License:** Flutter · Firebase

Westeros is a **cloud-powered lore intelligence app** that provides rich, structured, and real-time information about the world of **Game of Thrones** and **House of the Dragon**.

Built using **Flutter + Firebase**, the app delivers houses, dragons, legends, family trees, and historical content through a **scalable, real-time architecture**.

---

## 🌟 Overview

Westeros is designed as a **complete lore companion** for fans and a **portfolio-grade Flutter project** for developers.

It combines:

- ☁️ Firebase Realtime Database (single source of truth)
- 🔐 Firebase Authentication
- 📱 Modular Flutter UI architecture

---

## 🧠 What Westeros Does

- ✅ Provides detailed lore for Houses, Dragons, Legends, and Lineages
- 🏰 Separates timelines between *Game of Thrones* and *House of the Dragon*
- 🐲 Displays dragon histories and riders
- 🌳 Visualizes family trees and house relationships
- 📜 Centralizes legends and historical events
- 🔐 Secures access using Firebase Authentication

---

## ✨ Features

### 🏰 Houses of Westeros
- Major and minor houses
- Full historical descriptions
- Dedicated detail screens

### 🐲 Dragons
- Dragon profiles with history and significance
- Timeline-based lore

### 📜 Legends & Lore
- Mythical stories and major historical events
- Clean reading-focused UI

### 🌳 Family Trees
- House lineage and relationships
- Structured family tree screens

### 🗺️ World Map
- Westeros map screen for geographical context

### 🔐 Authentication
- Login / Signup using Firebase Authentication
- Forgot password support
- Architecture ready for user-based features

---

## 🧰 Tech Stack

### 🔹 Frontend
- Flutter
- Dart
- Modular screen-based architecture

### 🔹 Backend / Cloud
- Firebase Realtime Database – all content storage
- Firebase Authentication – user management

### 🔹 Architecture
- Feature-based folder structure
- Clean navigation flow
- Scalable and maintainable design

---

## ☁️ Real-Time Data Architecture

- Firebase Realtime Database is the **only data source**
- No local or hardcoded content
- Content updates do **not require app updates**
- Enables scalability and centralized management

---

## 📁 Repository Structure

```text
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
