import pandas as pd
from faker import Faker

# Initialize Faker
fake = Faker()

# Define maximum lengths
max_length1 = 10
max_length3 = 25

# Unique Generated data
unique_person_ids = [fake.unique.random_number(digits=10, fix_len=True) for _ in range(600)]


# Data for Blood table
blood_data = [
    {'sign': '+', 'type': 'A'},
    {'sign': '-', 'type': 'A'},
    {'sign': '+', 'type': 'B'},
    {'sign': '-', 'type': 'B'},
    {'sign': '+', 'type': 'O'},
    {'sign': '-', 'type': 'O'},
    {'sign': '+', 'type': 'AB'},
    {'sign': '-', 'type': 'AB'}
]

# Generate 400 rows of random data for Person table
person_data = [
    {
        'person_id': unique_person_ids[i],
        'last_name': fake.last_name()[:max_length1],
        'first_name': fake.first_name()[:max_length1],
        'email': fake.free_email()[:max_length3]
    }
    for i in range(600)
]


# Convert data to DataFrame
blood_df = pd.DataFrame(blood_data)
person_df = pd.DataFrame(person_data)

# Write DataFrames to TXT files for Blood and Person
blood_df.to_csv('blood.txt', index=False, sep=',', header=False)
person_df.to_csv('person.txt', index=False, sep=',', header=False)

