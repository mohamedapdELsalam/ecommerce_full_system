Backend - E-commerce API

📌 Overview

This is the backend API for the E-commerce application, built with PHP and MySQL. It handles user authentication, product management, and payment processing (to be added).

🚀 Features

User Authentication (Signup, Login, Password Reset)

Product Management

Favorites & Wishlist functionality

REST API for frontend communication

Future integration with Payment Gateway

🛠️ Technologies Used

PHP (Pure PHP Backend)

MySQL (Database Management)

Firebase (For push notifications)

Apache (Localhost Server)

📂 Project Structure

backend/
│── api/
│   ├── auth.php       # User Authentication
│   ├── products.php   # Product Management
│   ├── favorites.php  # Wishlist Feature
│   ├── payment.php    # Payment Gateway (Upcoming)
│── config/
│   ├── db.php         # Database Connection
│── index.php          # Main API Entry Point

🏗️ Installation

git clone <repository_link>
cd <backend_folder>
Setup Apache & MySQL
Import `database.sql` into MySQL
Run the server using XAMPP or any Apache Server

🔗 API Endpoints

Method

Endpoint

Description

POST

/api/auth.php

User Authentication

GET

/api/products.php

Fetch Products

POST

/api/favorites.php

Manage Wishlist

POST

/api/payment.php

Process Payment (Upcoming)

📌 Future Updates

💳 Payment Gateway Integration (PayPal, Stripe, etc.)

📦 Order Management System

📊 Admin Panel for Product Management

📜 License

This project is licensed under the MIT License - see the LICENSE file for details.

