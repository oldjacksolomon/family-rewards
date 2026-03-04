// Copy this file to firebase-config.js and fill in your Firebase project values.
// Get these from: Firebase Console → Project Settings → Your apps → (Web app) → SDK setup & configuration
//
// IMPORTANT: firebase-config.js is listed in .gitignore — never commit your real config values.
//
// Steps:
//   1. Go to https://console.firebase.google.com and create (or select) your project
//   2. Click the gear icon → Project Settings → scroll to "Your apps" → add a Web app
//   3. Copy the config object values below
//   4. Enable Authentication → Sign-in method → Email/Password
//   5. Create a Firestore database (start in production mode, choose a region)

const FIREBASE_CONFIG = {
    apiKey:            "YOUR_API_KEY",
    authDomain:        "YOUR_PROJECT_ID.firebaseapp.com",
    projectId:         "YOUR_PROJECT_ID",
    storageBucket:     "YOUR_PROJECT_ID.appspot.com",
    messagingSenderId: "YOUR_SENDER_ID",
    appId:             "YOUR_APP_ID"
};
