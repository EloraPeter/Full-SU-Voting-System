

````md
# 🗳️ Student Union Voting System (Full Stack)

A secure full-stack voting system built with Node.js, Express, PostgreSQL, and vanilla frontend (HTML/CSS/JS). It supports student elections with admin control, authentication, and secure vote tracking.

---

## 🚀 Project Overview

This system allows:

- Student registration and login  
- Category-based voting system  
- Admin management of elections and contestants  
- Secure vote storage with prevention of duplicate voting  
- Audit logging for system activity  

---

## 🧱 Tech Stack

### Frontend
- HTML5
- CSS3
- JavaScript (Vanilla)

### Backend
- Node.js
- Express.js
- PostgreSQL
- Passport.js authentication
- bcrypt for password hashing
- express-session
- helmet & morgan for security and logging

---

## 🗄️ Database Setup

Run the following SQL script in PostgreSQL:

```sql
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- USERS
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    matric_number VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT true,
    is_admin BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CATEGORIES
CREATE TABLE IF NOT EXISTS categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CONTESTANTS
CREATE TABLE IF NOT EXISTS contests (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    category_id UUID REFERENCES categories(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- VOTES
CREATE TABLE IF NOT EXISTS votes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    voter_id UUID REFERENCES users(id) ON DELETE CASCADE,
    contest_id UUID REFERENCES contests(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (voter_id, contest_id)
);

-- AUDIT LOGS
CREATE TABLE IF NOT EXISTS audit_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID,
    action TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
````

---

## ⚙️ Installation & Setup

### 1. Clone Project

```bash
git clone https://github.com/EloraPeter/Full-SU-Voting-System.git
```

---

### 2. Install Backend Dependencies

```bash
cd SU-voting-backend-master
npm install
```

---

### 3. Configure Environment

Create a `.env` file:

```env
DB_HOST=localhost
DB_USER=voting_user
DB_PASSWORD=yourdbpassword
DB_NAME=voting_system
NODE_ENV=development

PORT=5000
DATABASE_URL=your_postgres_connection_string
SESSION_SECRET=your_secret_key

FRONTEND_URL=http://localhost:8000
REACT_APP_API_URL=http://localhost:5000
```

---

### 4. Initialize Database

Run the SQL script above in PostgreSQL.

---

## 🚀 Running the System (IMPORTANT)

After installing everything and initializing the database, you do NOT need to manually start frontend or backend.

👉 Just run:

```bash
start-project.bat
```

---

## 🖱️ What the `.bat` file does

### 1. Starts Backend Server

```bash
cd SU-voting-backend-master && node server.js
```

### 2. Starts Frontend Server

```bash
cd SU-voting-frontend-master && python -m http.server 8000
```

### 3. Opens Browser Automatically

```
http://localhost:8000/pages/auth/login.html
```

---

## 🌐 System URLs

| Service  | URL                                            |
| -------- | ---------------------------------------------- |
| Frontend | [http://localhost:8000](http://localhost:8000) |
| Backend  | [http://localhost:5000](http://localhost:5000) |

---

## 🔐 Login URL

```
http://localhost:8000/pages/auth/login.html
```

---

## 🧩 Features

* Secure authentication system
* Student voting system
* Admin dashboard
* Category-based elections
* One-person-one-vote enforcement
* Audit logs for tracking actions

---

## 📁 Project Structure

```
SU-voting-frontend-master/
SU-voting-backend-master/
start-project.bat
```

---

## 🎯 Future Improvements

* Real-time vote updates (WebSockets)
* JWT authentication upgrade
* Mobile responsive redesign
* Blockchain-based vote verification
* Cloud deployment (AWS / Render / Railway)

---

## 👨‍💻 Author

**Elora Peter**
GitHub: [https://github.com/EloraPeter](https://github.com/EloraPeter)

---

## 📜 License

This project is for educational purposes only.

```

Just tell me 👍
```
