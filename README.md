# API Integration Demo - Flutter App

A complete Flutter application demonstrating API integration, HTTP requests, and JSON data handling for Week 4 of the internship program.

## 🎯 Project Overview

This Flutter app showcases how to:
- Fetch data from RESTful APIs using the `http` package
- Parse and display JSON data in Flutter
- Handle network requests with proper error handling and UI indicators
- Build a User Profile Screen with detailed information
- Implement robust error handling for failed API requests

## ✨ Features

### ✅ Core Requirements Met:
1. **HTTP Requests and JSON Parsing**
   - Uses `http` package to send requests to JSONPlaceholder API
   - Parses received JSON responses into Dart objects
   - Displays data using ListView with beautiful cards

2. **User Profile Screen**
   - Comprehensive user profile display
   - Shows name, email, phone, website
   - Displays complete address and company information
   - Tabbed interface with Profile and Posts tabs

3. **Error Handling and Loading Indicators**
   - Loading spinners while fetching data
   - Proper error messages with retry buttons
   - Network timeout handling (15 seconds)
   - Empty state handling

## 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point with theme
├── models/
│   ├── user.dart            # User data model
│   └── post.dart            # Post data model
├── services/
│   └── api_service.dart     # HTTP API service
├── screens/
│   ├── home_screen.dart     # Main navigation screen
│   ├── users_screen.dart    # Users list with loading/error states
│   ├── posts_screen.dart    # Posts list with loading/error states
│   └── user_profile_screen.dart # Detailed user profile
└── utils/
    └── constants.dart       # App constants and strings
```

## 📱 App Flow

1. **Home Screen**: Choose between Users or Posts
2. **Users Screen**: List all users with loading/error handling
3. **User Profile**: Detailed user info + their posts
4. **Posts Screen**: List all posts with loading/error handling

## 🔧 API Integration

The app uses the [JSONPlaceholder API](https://jsonplaceholder.typicode.com/) for:
- **Users**: `https://jsonplaceholder.typicode.com/users`
- **Posts**: `https://jsonplaceholder.typicode.com/posts`

### API Service Features:
- Singleton pattern for efficient HTTP client management
- 15-second timeout for network requests
- Comprehensive error handling
- Debug logging for troubleshooting

## 🛠️ Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  http: ^1.1.0
  cached_network_image: ^3.3.0
```

## 📸 Screenshots

<img width="623" height="808" alt="image" src="https://github.com/user-attachments/assets/4c72d962-df2b-4ce5-9044-7e4a703af992" />
<img width="618" height="730" alt="image" src="https://github.com/user-attachments/assets/52c492b5-71b3-425c-92a1-8756a3e05350" />
<img width="618" height="849" alt="image" src="https://github.com/user-attachments/assets/3da66ba7-cc1c-4da4-ba3b-175d479fca2d" />
<img width="619" height="893" alt="image" src="https://github.com/user-attachments/assets/faaa754a-16c9-4f26-806e-b53fd30f1fbd" />

## 🎓 Learning Objectives Achieved

✅ **Understand how to fetch data from RESTful APIs**
- Implemented HTTP GET requests using the `http` package
- Used JSONPlaceholder API for real data

✅ **Learn to parse and display JSON data in Flutter**
- Created User and Post models with fromJson/toJson methods
- Displayed parsed data in ListView with custom cards

✅ **Handle network requests with proper error handling and UI indicators**
- Loading spinners during API calls
- Error messages with retry functionality
- Network timeout handling
- Empty state management

## 🔍 Testing

The app includes a "Test API Connection" button on the home screen that:
- Tests both Users and Posts API endpoints
- Shows success/failure results
- Displays the number of items fetched
- Helps verify API connectivity

## 👨‍💻 Author

**Zahra Dua** - Internship Task 4 - HTTP Request Implementation

---

**Note**: This app demonstrates best practices for API integration in Flutter, including proper error handling, loading states, and user experience considerations.
