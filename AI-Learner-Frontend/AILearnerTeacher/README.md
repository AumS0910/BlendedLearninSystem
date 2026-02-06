# AI Learner Teacher App

Flutter app used by teachers to:
- create and publish learning activities,
- upload course cover images,
- add quizzes/questions,
- monitor activity and quiz-related learning flow.

## Run
```bash
flutter pub get
flutter run
```

## Backend Integration
The app posts course and quiz data to backend APIs (`/course/add`, `/quizzes`) and uploads images through backend-Cloudinary integration.

## Setup Notes
- Place `google-services.json` in `android/app`.
- Enable Firebase Authentication and Firestore for your Firebase project.
