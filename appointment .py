import mysql.connector
import os
from datetime import datetime

# MySQL connection
def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="your_user",
        password="your_password",
        database="MindCareDB"
    )

# Load SQL query from file
def load_query(filename):
    with open(filename, 'r') as file:
        return file.read()

# Parse available time slots from counselor availability string
def parse_availability(avail_string):
    # Example: "Mon-Fri 9am-3pm"
    # For demo purposes, return dummy list
    return ["10:00:00", "11:00:00", "12:00:00", "14:00:00"]  # Static mock times

# Main booking flow
def book_appointment():
    conn = get_connection()
    cursor = conn.cursor()

    # Step 1: List counselors
    query = load_query('queries/list_counselors.sql')
    cursor.execute(query)
    counselors = cursor.fetchall()

    print("\nAvailable Counselors:")
    for c in counselors:
        print(f"{c[0]}. {c[1]} - Available: {c[2]}")
    
    # Step 2: Select counselor
    counselor_id = int(input("\nEnter Counselor ID to book: "))

    # Step 3: Ask for user ID (must exist)
    user_id = int(input("Enter your User ID: "))

    # Step 4: Enter date and show available time slots
    date = input("Enter appointment date (YYYY-MM-DD): ")
    chosen_counselor = next(c for c in counselors if c[0] == counselor_id)
    time_slots = parse_availability(chosen_counselor[2])
    
    print("\nAvailable Time Slots:")
    for i, t in enumerate(time_slots):
        print(f"{i+1}. {t}")
    
    time_choice = int(input("Choose a time slot number: "))
    appointment_time = time_slots[time_choice - 1]

    # Step 5: Insert appointment
    insert_query = load_query('queries/insert_appointment.sql')
    cursor.execute(insert_query, (user_id, counselor_id, date, appointment_time))
    conn.commit()

    print("\n✅ Appointment booked successfully!")

    cursor.close()
    conn.close()

if __name__ == "__main__":
    book_appointment()
