# MoneyMonitor APP

## THE IDEA

##### I wanna create an app that I will daily use to monitor my money usage, in which I will fully customize it based on my needs.
##### I will use google sheets api to get my entire data the app so I can analyze it.. either everytime reading or saving it into firestore or a local db. I will see when I start development

##### also for new entires, I will use the google forms end point so I submit the data into google sheets to be extra safe!!
```
 example of submitting a data directly to google sheets 
"https://docs.google.com/forms/d/e/1FAIpQLSeqxrJ6IEiCkbEmnR43S12qNiDYPOhOHSwKVSRyR9PCyg_w9w/formResponse?&submit=Submitusp=pp_url&entry.1439608208=Groceries&entry.59748756=100000&entry.1558708269=SAR"

This will submit
Groceries, 100000, SAR

```

1️⃣ Project Setup

2️⃣ Google Sheets Integration
Step 1: Enable Google Sheets API
Step 2: Read & Write to Google Sheets

3️⃣ Firestore Integration
✅ Create a Firestore database in Firebase.
✅ Define a structure like:
users/{userId}/transactions/{transactionId}
✅ Implement FirestoreService.dart to:

Store transactions locally & sync with Google Sheets.
Retrieve transactions for history & filtering.



4️⃣ Implement Core Features
🔹 Expense Tracking Page
✅ UI for adding new transactions (amount, category, date).
✅ Save to Firestore first, then sync to Google Sheets.

🔹 Transaction History Page
✅ Fetch transactions from Firestore.
✅ Add filters (date, category).

🔹 Charts & Statistics Page
✅ Embed Google Sheets charts in a WebView.
✅ Generate Flutter dynamic charts using fl_chart.

5️⃣ Sync Logic (Google Sheets & Firestore)
✅ Automatic batch sync at 12 AM.
✅ Manual sync button for instant updates.
✅ Handle conflicts (e.g., if offline transactions exist).

6️⃣ UI & Design
✅ Minimalist design with multiple pages:

Home (Overview)
Add Transaction
History
Charts & Stats
Settings (Sync, Filters, etc.)
✅ Dark Mode support (optional).

7️⃣ Testing & Optimization
✅ Test offline mode (Firestore caching).
✅ Test sync delays with Google Sheets API limits.
✅ Optimize Firestore reads/writes to avoid extra costs.


