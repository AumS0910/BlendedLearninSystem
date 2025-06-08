# 📚 Blended Learning System – Skill-Based Faculty-Student Connect

## 🔍 Overview
Blended Learning System is a full-stack application that enables students to follow and connect with faculty members based on specific skill tags. The system encourages personalized learning experiences by offering skill-matching, chat functionality, and real-time interactions.

## 🛠 Tech Stack
- Backend: Java, Spring Boot (REST APIs)
- Frontend: Flutter, Dart (Mobile)
- Database: Firebase Firestore
- Tools: Android Studio, Postman, GitHub

## 🚀 Features
- 🔖 Skill-Based Follow System: Students follow faculty by selected skill tags.
- 💬 Chat Functionality: Real-time communication using Firebase.
- 📱 Mobile UI: Flutter-based responsive app for both students and faculty.
- 📊 Dashboard View: Display followed skills, teacher connections, and messages.
- 🛡️ Role-Based Logic: Separate UI flows for teachers and students.

## 🔁 How It Works
1. Student selects skill tags and follows faculty with matching profiles.
2. The system saves relationships and provides chat initiation options.
3. Teachers can manage incoming connections and respond to queries.
4. Backend is RESTful and connected to Firebase for real-time sync.

## 📸 Screenshots
<!-- Add image links when available -->
<!-- ![Home Screen](./assets/home.png) -->
<!-- ![Chat Screen](./assets/chat.png) -->

## 📁 Project Structure
- `/backend`: Spring Boot APIs (Faculty, Student, Skills, Chat logic)
- `/frontend`: Flutter app files (UI, authentication, Firebase integration)

## 🔧 Setup Instructions

### Backend (Spring Boot)
1. Clone the repo and open the backend directory.
2. Run with:
```bash
./mvnw spring-boot:run
