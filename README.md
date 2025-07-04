# Poll & Voting App

##  Technologies Used
- Java (Servlets, JSP)
- MySQL
- Bootstrap
- HTML/CSS
- JavaScript

##  Setup Instructions
1. Clone the repository
2. Import in NetBeans/Eclipse
3. Set up MySQL database with provided schema
4. Run on Apache Tomcat

##  Features
- Admin: Create, edit, delete polls
- User: Vote on polls once
- View results after poll closes
- Role-based access

 

## Sample Credentials
- Admin: `ry@gmail.com` / `12`
- User: `ash@gmail.com` / `12`

## 📊 ER Diagram
![ER Diagram](link_to_diagram_image)

##  API Endpoints
| Method | Route              | Description               |
|--------|--------------------|---------------------------|
| GET    | /polls             | List all polls            |
| POST   | /polls/create      | Create new poll (admin)   |
| POST   | /vote              | Vote on a poll            |
| GET    | /polls/results     | View results (after close)|

##  Demo Video
 https://www.loom.com/share/4cd43e75ed3d475c9c04531fbb796df6?sid=2a66305d-fc73-4072-9d28-18c83340aedb

