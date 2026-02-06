# AI Learner Backend

Spring Boot backend for AI Learner. Provides REST APIs for students, courses, quizzes, quiz analytics, and image uploads.

## Stack
- Java 21
- Spring Boot 3.2
- Spring Web
- Spring Data MongoDB
- Cloudinary Java SDK

## Backend Responsibilities
- Student CRUD APIs
- Course CRUD APIs
- Quiz create/fetch APIs
- Quiz analysis persistence and retrieval
- Course cover image upload to Cloudinary

## Project Layout
```text
src/main/java/com/ailearner/app/AILearner/
|-- controllers/   # HTTP endpoints
|-- service/       # business logic
|-- repository/    # Mongo repositories
|-- entity/        # Mongo document models
`-- config/        # Cloudinary config
```

## API Base URLs
- Local: `http://localhost:8080`
- Deployed (used in Flutter code): `https://al-learner-backend.onrender.com`

## Main Endpoints

### Students
- `GET /students/greet`
- `GET /students`
- `GET /students/{id}`
- `POST /students`
- `PUT /students/{id}`
- `DELETE /students/{id}`

### Courses
- `GET /course`
- `GET /course/{id}`
- `POST /course/add` (multipart form: title, aim, theory, videoUrl, conclusion, image)
- `PUT /course/{id}`
- `DELETE /course/{id}`

### Quizzes
- `POST /quizzes`
- `GET /quizzes`
- `GET /quizzes/{quizId}`

### Quiz Analysis
- `POST /quiz-analyses`
- `GET /quiz-analyses/user/{userId}`

### Cloudinary Upload
- `POST /cloudinary/upload` (multipart form with `image`)

## Example Requests

Create student:
```bash
curl -X POST http://localhost:8080/students \
  -H "Content-Type: application/json" \
  -d '{"name":"Aarav","PRN":12345,"rollNo":12,"email":"aarav@example.com"}'
```

Create course with image:
```bash
curl -X POST http://localhost:8080/course/add \
  -F "title=OOP Basics" \
  -F "aim=Understand classes and objects" \
  -F "theory=Object-oriented programming concepts" \
  -F "videoUrl=https://example.com/video" \
  -F "conclusion=Practice with mini examples" \
  -F "image=@cover.png"
```

## Configuration
Copy `Al-Learner-Backend/.env.example` to `Al-Learner-Backend/.env` and fill real values:

```dotenv
SPRING_APPLICATION_NAME=AILearner
MONGODB_URI=<your-mongodb-uri>
MONGODB_DATABASE=<your-database>
CLOUDINARY_CLOUD_NAME=<your-cloudinary-cloud-name>
CLOUDINARY_API_KEY=<your-cloudinary-api-key>
CLOUDINARY_API_SECRET=<your-cloudinary-api-secret>
```

`src/main/resources/application.properties` is already set to read these values from environment variables and import `.env`.
`Al-Learner-Backend/.env` is ignored by git.

## Run Locally
```bash
cd Al-Learner-Backend
./mvnw spring-boot:run
```
Windows PowerShell:
```powershell
.\mvnw.cmd spring-boot:run
```

## Run Tests
```bash
./mvnw test
```

## Notes
- Current controllers/services use simple CRUD flows and can be extended with validation, DTOs, and exception handling for production hardening.
- If you change endpoint contracts, update both Flutter apps accordingly.

