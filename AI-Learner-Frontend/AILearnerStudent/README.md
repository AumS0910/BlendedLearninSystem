# AI Learner Student App

Flutter app used by students to:
- browse learning activities,
- attempt quizzes,
- use interest-based learning flows,
- access AI-assisted doubt solving features.

## Run
```bash
flutter pub get
flutter run
```

## Backend Integration
The app fetches course and quiz data from the backend APIs (`/course`, `/quizzes`) and uses Firebase for authentication and user profile storage.

## Setup Notes
- Place `google-services.json` in `android/app`.
- Enable Firebase Authentication and Firestore for your Firebase project.
