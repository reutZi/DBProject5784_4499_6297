import pandas as pd
from faker import Faker

# Initialize Faker
fake = Faker()

# Define maximum lengths
max_length1 = 10
max_length2 = 20
max_length3 = 25

# Unique Generated data
unique_hospital_ids = [fake.unique.random_number(digits=10, fix_len=True) for _ in range(400)]
unique_donation_place_ids = [fake.unique.random_number(digits=10, fix_len=True) for _ in range(400)]
unique_phone_ids = [fake.unique.bothify(text='05########') for _ in range(400)]

# Generate 400 rows of random data for Receiver table
receiver_data = [
    {
        'hospital_id': unique_hospital_ids[i],
        'hospital_name': fake.company()[:max_length1],
        'city': fake.city()[:max_length1],
        'delivery_date': fake.date_between(start_date='-13y', end_date='today'),
        'hospital_phone': unique_phone_ids[i]
    }
    for i in range(400)
]

# Generate 400 rows of random data for Donation_place table
donation_place_data = [
    {
        'place_id': unique_donation_place_ids[i],
        'place_phone': fake.bothify(text='05########'),
        'manager': fake.name()[:max_length2],
        'address': fake.city()[:max_length3]
    }
    for i in range(400)
]

# Convert data to DataFrame
receiver_df = pd.DataFrame(receiver_data)
donation_place_df = pd.DataFrame(donation_place_data)


# Function to generate SQL insert statements
def df_to_sql_insert(table_name, df):
    insert_statements = []
    for _, row in df.iterrows():
        values = ', '.join(f"'{str(value)}'" for value in row)
        insert_statements.append(f"INSERT INTO {table_name} VALUES ({values});")
    return '\n'.join(insert_statements)


# Generate SQL insert statements for each table
receiver_sql = df_to_sql_insert('Receiver', receiver_df)
donation_place_sql = df_to_sql_insert('Donation_place', donation_place_df)

# Combine all SQL statements into one script
sql_script1 = f"""
-- Receiver table
{receiver_sql}
"""

sql_script2 = f"""
-- Donation_place table
{donation_place_sql}
"""

# Write the SQL script to a file
with open('insertReceiver.sql', 'w') as file:
    file.write(sql_script1)

with open('insertDonationPlace.sql', 'w') as file:
    file.write(sql_script2)
