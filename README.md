# AI Learner 

Welcome to the AI Learner project! </br>
This project aims to create an engaging and personalized learning environment for students and a guided activity created by the teacher for a structured path. Utilizing Flutter, Firebase, and Spring Boot, we've developed a platform that enhances educational experiences through advanced features and modern technologies.

## Features
**Learning from Activities**: The teacher can create learning activities with quizzes for students to learn and follow a structured path. The Learning Activity contains the title, aim, theory, video, conclusion and quiz.

**Interest-based Learning**: Implemented using Gemini AI to tailor learning materials according to students' interests. example: if a student is interested in OOP then AI will teach the student using his interest which will help him depth understanding.

**Personalized Learning**: Facilitates better engagement by offering content personalized to each student's learning preferences.
        

## Tech Stack
 
**Flutter**: Ensure a smooth and interactive user experience for front-end development.
    
**Firebase**: Provides robust backend services such as authentication.
    
**Spring Boot**: Powers the server-side application, enabling efficient and scalable backend processing.

## Screenshots

<img src="https://github.com/user-attachments/assets/376d64eb-5643-496d-bfe7-ba8a32e660cd" width="550" title="hover text">

<img src="https://github.com/user-attachments/assets/fca1022d-cf1d-41e4-ab6b-f69c6593407f" width="550" title="hover text">

<img src="https://github.com/user-attachments/assets/e5c6a3dd-04aa-4477-8e2e-2770d739c7b1" width="550" title="hover text">

### Teacher View
<img src="https://github.com/user-attachments/assets/9dc89a81-83c1-4e56-acdb-1f891d1a24a3" width="550" title="hover text">

### Login and Register
<img src="https://github.com/user-attachments/assets/0376567d-8018-44d5-943e-379d1f135464" width="550" title="hover text">


## Flow 

### Student View
1. **Attempt Learning Activity**:Engage with learning materials created by teachers

2. **Taking the Quiz**: Assess understanding through quizzes

3. **Generating Examples Based on Interest**:
        Receive personalized examples to enhance understanding

4. **Doubt Solving AI Bot**:Ask questions and receive answers from an AI bot</br>
Example query: "Explain OOP in terms of Cricket"
        Example response: "Players, ball, and field are objects; each has specific attributes (e.g., player's name, ball's position) and behaviors (e.g., player's batting, ball's movement)."

### Teacher View

1. **Creating the Learning Activity**:</br>
        Add a Title</br>
        Set Aim/Objectives</br>
        Provide Theory</br>
        Attach Videos</br>
        Write Conclusions</br>

2. **Monitoring Learning Process**:</br>
        Track student progress through quizzes.
        
## Installation
Prerequisites

    Flutter SDK
    Firebase account
    Spring Boot setup

### Steps

1. Clone the Repository
    `git clone https://github.com/RiteshBakare/AI-Learner.git`


2. ``cd AILearnerStudent``
3. ``flutter pub get``
4. Create a Firebase account paste the google-services.json file in AILearnerStudent/android/app and enable Firebase auth 
5. ``flutter run``

6. ``cd AILearnerTeacher``
7. ``flutter pub get``
8. ``flutter run``
9. ``cd Al-Learner-Backend``
10. ``./mvnw spring-boot:run ``


### Contributing
We welcome contributions! Please follow these steps:

1. Fork the repository.

2. Create a new branch (git checkout -b feature/your-feature).

3. Commit your changes (git commit -m 'Add some feature').

4. Push to the branch (git push origin feature/your-feature).

5. Open a pull request.

---
<h4>Thank you for checking out our project! We hope you find it useful and engaging. If you have any questions or feedback, please feel free to reach out. Happy learning! </h4>

---
Stay connected and keep learning! 🚀
