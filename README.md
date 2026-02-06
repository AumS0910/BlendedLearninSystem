# AI Learner Platform

AI Learner is a blended-learning platform with a teacher-facing app, a student-facing app, and a Spring Boot backend.

## What This Project Solves
- Lets teachers create structured learning activities (title, aim, theory, video, conclusion, quizzes).
- Lets students learn through activities and attempt quizzes.
- Supports interest-based and AI-assisted learning flows in the student experience.

## Repository Structure
```text
.
|-- AI-Learner-Frontend/
|   |-- AILearnerStudent/   # Flutter app for students
|   `-- AILearnerTeacher/   # Flutter app for teachers
|-- Al-Learner-Backend/     # Spring Boot + MongoDB backend
`-- README.md
```

## Tech Stack
- Frontend: Flutter (Student + Teacher apps)
- Auth/User Data: Firebase Auth + Firestore
- Backend API: Spring Boot (Java 21), Spring Web, Spring Data MongoDB
- Database: MongoDB Atlas
- Media Storage: Cloudinary
- Deployment: Render (backend endpoint used by Flutter apps)

## Quick Start

### Prerequisites
- Flutter SDK
- Java 21
- Maven (or use the Maven wrapper)
- MongoDB Atlas connection URI
- Cloudinary account
- Firebase project (for both Flutter apps)

### 1) Clone
```bash
git clone https://github.com/AumS0910/BlendedLearninSystem.git
cd BlendedLearninSystem
```

### 2) Run Backend
Before running:
- Copy `Al-Learner-Backend/.env.example` to `Al-Learner-Backend/.env`
- Fill your MongoDB and Cloudinary values in `Al-Learner-Backend/.env`

```bash
cd Al-Learner-Backend
./mvnw spring-boot:run
```
On Windows PowerShell:
```powershell
.\mvnw.cmd spring-boot:run
```

Backend local URL: `http://localhost:8080`

### 3) Run Student App
```bash
cd AI-Learner-Frontend/AILearnerStudent
flutter pub get
flutter run
```

### 4) Run Teacher App
```bash
cd AI-Learner-Frontend/AILearnerTeacher
flutter pub get
flutter run
```

## Module Docs
- Backend documentation: `Al-Learner-Backend/README.md`
- Frontend overview: `AI-Learner-Frontend/README.md`
- Resume-ready backend bullets: `Al-Learner-Backend/RESUME_BULLETS.md`

## Security Note
Secrets such as database URIs, Cloudinary keys, and Firebase service files should be managed via environment-specific config and never committed to source control.
