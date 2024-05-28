import random
from datetime import datetime, timedelta

# names
names = [
    "Olivia", "Emma", "Ava", "Sophia", "Isabella", "Mia", "Charlotte", "Amelia", "Harper", "Evelyn",
    "Abigail", "Ella", "Scarlett", "Grace", "Lily", "Aurora", "Zoey", "Hannah", "Addison", "Aubrey",
    "Ellie", "Stella", "Natalie", "Mila", "Lucy", "Paisley", "Nora", "Lillian", "Hazel", "Riley",
    "Leah", "Violet", "Aria", "Penelope", "Layla", "Luna", "Savannah", "Brooklyn", "Bella", "Claire",
    "Avery", "Anna", "Samantha", "Sadie", "Skylar", "Allison", "Maya", "Eva", "Madison", "Chloe",
    "Madelyn", "Caroline", "Serenity", "Kennedy", "Aaliyah", "Sarah", "Autumn", "Quinn", "Ariana", "Naomi",
    "Alice", "Molly", "Jade", "Piper", "Taylor", "Peyton", "Alexis", "Lydia", "Aubree", "Eliana",
    "Clara", "Isabelle", "Vivian", "Melanie", "Everly", "Kinsley", "Valentina", "Lila", "Josephine", "Alyssa",
    "Sophie", "Delilah", "Willow", "Ivy", "Bailey", "Natalia", "Katherine", "Elena", "Isla", "Adeline",
    "Cora", "Aurora", "Lillian", "Ruby", "Eva", "Emilia", "Madeline", "Eloise", "Hazel", "Brielle",
    "Jasmine", "Julia", "Andrea", "Reagan", "Rose", "Rylee", "Alexandra", "Adalyn", "Kaitlyn", "Vivienne",
    "Gabriella", "Gianna", "Mackenzie", "Kaylee", "Madilyn", "Makenna", "Nicole", "Juliet", "Sloane", "Teagan",
    "Callie", "Keira", "Arabella", "Brianna", "Genevieve", "Lola", "Alaina", "Catalina", "Eden", "Emery",
    "Gracie", "Rosalie", "Athena", "Amaya", "Daisy", "Luna", "Millie", "Hope", "Leilani", "Eliza",
    "Haley", "Morgan", "Ashley", "Aubrie", "Ruth", "Freya", "Gemma", "Josie", "Adelaide", "Catherine",
    "Emerson", "Faith", "Brooke", "Jordyn", "Zara", "Emersyn", "Elsie", "Nina", "Sawyer", "Raegan",
    "Blake", "Amira", "Alina", "Reese", "Sienna", "Parker", "Alana", "Sutton", "Journey", "Blakely",
    "Dakota", "Malia", "Marley", "Rowan", "Selena", "Alivia", "Sage", "Logan", "Finley", "Aspen",
    "Jayla", "Ayla", "Fiona", "Phoebe", "Arianna", "Raelynn", "Lena", "Camilla", "Adrianna", "Miriam",
    "Noelle", "Serena", "Lilliana", "Anastasia", "Harley", "Mariana", "Daphne", "Hayden", "Nylah", "Jocelyn",
    "Elise", "Julianna", "Bianca", "Myla", "Aniyah", "Annie", "Lena", "Annalise", "Ada", "Matilda",
    "Makayla", "Maggie", "Brooklynn", "Kendall", "Juliana", "Talia", "Giselle", "Skyler", "Nina", "Haven"
]

# last names
last_names = [
    "Smith", "Johnson", "Williams", "Brown", "Jones",
    "Garcia", "Miller", "Davis", "Anderson", "Wilson",
    "Moore", "Taylor", "Thomas", "Evans", "Martinez",
    "Hernandez", "Robinson", "Lewis", "Clark", "Rodriguez",
    "Walker", "Hall", "Allen", "Young", "King",
    "Wright", "Lopez", "Scott", "Green", "Nguyen",
    "Walker", "Phillips", "Carter", "Campbell", "Mitchell",
    "Roberts", "Garcia", "Ramirez", "Cruz", "Lewis",
    "Rogers", "Moore", "Sanchez", "Lee", "Johnson",
    "Nelson", "Williams", "Brown", "Garcia", "Jones",
    "Miller", "Davis", "Clark", "Rodriguez", "Wilson",
    "Moore", "Taylor", "Thomas", "Allen", "Hernandez",
    "Hall", "Wright", "Lopez", "Walker", "Scott",
    "Robinson", "Hernandez", "Nguyen", "Campbell", "Mitchell",
    "Rogers", "Moore", "Sanchez", "Young", "Allen",
    "Nelson", "Phillips", "Roy", "Carter", "Adams",
    "Diaz", "Ramirez", "Cruz", "Hernandez", "Garcia",
    "Kim", "Nelson", "Thomas", "Lee", "Harris",
    "Watson", "Moore", "Garcia", "Allen", "Anderson",
    "Wright", "Lopez", "Hernandez", "Clark", "Rogers",
    "Lewis", "Robinson", "Walker", "Scott", "Mitchell",
    "Rodriguez", "Hernandez", "Johnson", "Young", "Allen",
    "Thompson", "Garcia", "Moore", "Hernandez", "Davis",
    "Nguyen", "Lopez", "Wilson", "Rodriguez", "Clark",
    "Lee", "Hernandez", "Robinson", "Walker", "Campbell",
    "Allen", "Wright", "Scott", "Lewis", "Miller",
    "Carter", "Rodriguez", "Hernandez", "Moore", "Garcia",
    "Young", "Allen", "Thomas", "Johnson", "Williams",
    "Davis", "Hernandez", "Lopez", "Miller", "Anderson",
    "Clark", "Nguyen", "Rogers", "Wilson", "Moore",
    "Walker", "Mitchell", "Garcia", "Hernandez", "Lewis",
    "Robinson", "Allen", "Campbell", "Wright", "Scott",
    "Rodriguez", "Hernandez", "Lopez", "Nelson", "Thomas",
    "Lee", "Harris", "Garcia", "Allen", "Moore"
]

roles = ["teacher", "assistant"]


# Function to generate a random phone number
def generate_phone_number():
    return f"05{random.randint(10000000, 99999999)}"


# Function to generate a random date within the past 30 years
def generate_experience_date(start_year=1990, end_year=2023):
    """Generates a random date between start_year and end_year."""
    start_date = datetime(start_year, 1, 1)
    end_date = datetime(end_year, 12, 31)
    random_date = start_date + timedelta(days=random.randint(0, (end_date - start_date).days))
    return random_date.strftime('%Y/%m/%d')


# Open a file to write the SQL statements
with open("insert_teachers.sql", "w") as f:

    for i in range(1, 401):
        teacher_id = i
        name = random.choice(names)+' '+random.choice(last_names)
        phone = generate_phone_number()
        experience_date = generate_experience_date()
        role = random.choice(roles)
        kindergarten_id = random.randint(1, 150)
        # Write the SQL statement
        f.write(f"""INSERT INTO ETIK.TEACHER(TEACHER_ID, T_NAME, PHONE, EXPERIENCE_DATE, T_ROLE, KINDERGARTENID) 
            VALUES({teacher_id}, '{name}', '{phone}', TO_DATE('{experience_date}', 'yyyy/mm/dd'), '{role}', {kindergarten_id});\n""")

        # Add a comma for all but the last row

print("Data generation complete. Check insert_teachers.sql for the SQL insert statements.")
