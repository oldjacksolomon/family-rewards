# Family Rewards Dashboard

A multi-family hosted web app for tracking kids' reward points.
Parents manage their household; children log in with a Family Code + PIN to view their balance and request points.

**No build step** — plain HTML files + Firebase backend.

---

## Firebase Setup (required)

### Step 1 — Create a Firebase project
1. Go to [https://console.firebase.google.com](https://console.firebase.google.com)
2. Click **Add project**, give it a name (e.g. `family-rewards`)
3. Disable Google Analytics (optional), click **Create project**

### Step 2 — Enable Authentication
1. In the left sidebar: **Build → Authentication → Get started**
2. Under **Sign-in method**, enable **Email/Password** → Save

### Step 3 — Create Firestore database
1. In the left sidebar: **Build → Firestore Database → Create database**
2. Choose **Start in production mode**
3. Select a region close to you → Enable

### Step 4 — Register a Web app
1. Click the gear icon → **Project settings**
2. Scroll to **Your apps** → click the `</>` (Web) icon
3. Give it a nickname (e.g. `family-rewards-web`) → **Register app**
4. Copy the `firebaseConfig` values shown

### Step 5 — Configure the app
```bash
cp firebase-config.example.js firebase-config.js
```
Open `firebase-config.js` and fill in your values from Step 4.

### Step 6 — Deploy Firestore rules
Install the Firebase CLI if you haven't:
```bash
npm install -g firebase-tools
firebase login
```
Update `.firebaserc` with your project ID, then:
```bash
firebase deploy --only firestore:rules
```

### Step 7 — (Optional) Deploy to Firebase Hosting
```bash
firebase deploy --only hosting
```
Your app will be live at `https://YOUR_PROJECT_ID.web.app`

---

## Running locally

The local dev servers still work — they serve all three HTML pages.

**Linux / macOS / Git Bash:**
```bash
bash serve.sh
```

**Windows (Command Prompt):**
```bat
serve.bat
```

**Manual (Python 3):**
```bash
python3 serve.py
```

Then open **http://localhost:8080** in your browser.

> **Note:** Firebase Auth and Firestore work over `localhost` without any extra configuration.

---

## File structure

```
family-rewards/
├── index.html                  # Landing page + login (parent & child)
├── parent.html                 # Parent dashboard
├── child.html                  # Child view
├── firebase-config.js          # Your Firebase config (gitignored — never commit)
├── firebase-config.example.js  # Template — copy and fill in
├── firestore.rules             # Firestore security rules
├── firebase.json               # Firebase Hosting config
├── .firebaserc                 # Firebase project alias
├── serve.py                    # Python 3 local server
├── serve.sh                    # Bash launcher
├── serve.bat                   # Windows launcher
└── README.md
```

---

## How it works

### Parent flow
1. Sign up at `index.html` → a **Family Code** is generated (e.g. `GRIM-X7K2`)
2. Add children via the dashboard, optionally set a 4-digit PIN per child
3. Share the Family Code and each child's PIN with your kids
4. Award/deduct points, approve point requests, manage the chore catalog, and cash out points

### Child flow
1. Go to `index.html` → **Child Login**
2. Enter Family Code → pick your name → enter your PIN
3. View your balance and recent activity
4. Submit point requests (from the chore catalog or free-text)

### Point Requests & Chore Catalog
- Parents define a **Chore Catalog** (e.g. "Wash dishes = 15 pts") in the dashboard
- Children see the active catalog and tap a chore to pre-fill a request
- Children can also write a free-text description for anything not in the catalog
- Parents approve or reject requests from the **Requests** panel — approved requests automatically add points

---

## Features

- Multi-family: each family has its own account and isolated data
- Parent login via email/password (Firebase Auth)
- Child login via Family Code + 4-digit PIN (no email required)
- Real-time point balance updates (Firestore onSnapshot)
- Add / remove children with emoji avatars
- Award or deduct points with reasons
- Cash out points at **10 pts = $1.00**
- Chore catalog (parent-defined tasks with point values, active/inactive toggle)
- Point request system with catalog or free-text
- Full activity log, cash-out history
- Export all data to CSV
- Functional sidebar navigation (Dashboard, Requests, Catalog, History, Settings)

---

## Security notes

- Child PINs are stored as SHA-256 hashes. A 4-digit PIN has only 10,000 possible values, making it brute-forceable from the hash. This is acceptable for a family app but worth noting.
- Firestore rules prevent unauthenticated clients from writing to children's data or activity logs. Children can only create point requests.
- `firebase-config.js` is gitignored. Your API key is safe to include in a web app (Firebase restricts it by domain/referrer in the Firebase Console).
