import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import csv
import datetime


# Initialize the Firebase Admin SDK
cred = credentials.Certificate("/Users/brownej3/Documents/Tests/Keys/sports-preferences-firebase-adminsdk-8prdy-6f92d58ecd.json")
firebase_admin.initialize_app(cred)

# Access Firestore
db = firestore.client()

# Read user sports preferences and count
sports_preferences_count = {}

# Query sportsPreferences subcollection across all users
prefs_query = db.collection_group("sportsPreferences")
docs = prefs_query.stream()

print("Iterating through sportsPreferences documents...")
for doc in docs:
    preferences = doc.to_dict().get("preferences", [])
    print(f"Preferences: {preferences}")

    for pref in preferences:
        sports_preferences_count[pref] = sports_preferences_count.get(pref, 0) + 1

print("Sports preferences count:")
for sport, count in sports_preferences_count.items():
    print(f"{sport}: {count}")

# Export results to a CSV file
today = datetime.date.today().strftime('%Y-%m-%d')
filename = f'sports_preferences_count_{today}.csv'

with open(filename, 'w', newline='') as csvfile:
    fieldnames = ['Sport', 'Count']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

    writer.writeheader()
    for sport, count in sports_preferences_count.items():
        writer.writerow({'Sport': sport, 'Count': count})

print(f"Data exported to {filename}")
