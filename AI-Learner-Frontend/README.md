# AI Learner Frontend

This folder contains two Flutter apps:
- `AILearnerStudent`: Student-facing learning app
- `AILearnerTeacher`: Teacher-facing activity-creation app

## Prerequisites
- Flutter SDK
- Firebase project configured for each app
- Running backend API (`Al-Learner-Backend`) or deployed backend URL

## Run Student App
```bash
cd AILearnerStudent
flutter pub get
flutter run
```

## Run Teacher App
```bash
cd AILearnerTeacher
flutter pub get
flutter run
```

## Notes
- Both apps use Firebase Auth/Firestore for user flows.
- Backend API integration points are currently configured in page/service files using deployed Render URLs.
