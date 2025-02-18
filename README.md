# ecommerceapp

A new Flutter project.

## Getting Started
📌 Overview

This is the frontend of an E-commerce mobile application built with Flutter and GetX for state management. The app supports multiple languages, user authentication, favorites, and a smooth UI/UX experience.

🚀 Features

User authentication (Login, Signup, Forgot Password)

Home Page with product listing

Favorites & Wishlist functionality

Multi-language support (Arabic, English, German, Spanish)

Bottom Navigation Bar for easy navigation

Settings Page with customization options

Future integration for payment gateway

🛠️ Technologies Used

Flutter for cross-platform development

GetX for state management

Firebase (for notifications, authentication will be added later)

REST API for backend communication

📂 Project Structure

lib/
│── controllers/      # GetX Controllers
│── models/          # Data Models
│── views/           # UI Screens
│── widgets/         # Reusable components
│── services/        # API calls & local storage
│── main.dart        # Main entry point

🏗️ Installation

git clone <repository_link>
cd <project_folder>
flutter pub get
flutter run

📡 API Integration

Make sure to connect the frontend with the backend by setting up the API endpoints in the services/api_service.dart file.

📌 Future Updates

🛒 Payment Gateway Integration

📦 Order History & Tracking

🔍 Search & Filters for products

📜 License

This project is licensed under the MIT License - see the LICENSE file for details.

