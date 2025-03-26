import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

file_path = 'd:/College/Semester 4 (kec web)/Statistik-Komputasi/data/Titanic-Dataset.csv'
df = pd.read_csv(file_path)

missing_age = df['Age'].isnull().sum()
missing_fare = df['Fare'].isnull().sum()

print("Jumlah data yang hilang di 'Age':", missing_age)
print("Jumlah data yang hilang di 'Fare':", missing_fare)

plt.figure(figsize=(12, 5))

plt.subplot(1, 2, 1)
sns.histplot(df['Age'].dropna(), bins=20, kde=True)
plt.title('Distribusi Age')
plt.xlabel('Age')
plt.ylabel('Frekuensi')

plt.subplot(1, 2, 2)
sns.histplot(df['Fare'].dropna(), bins=20, kde=True)
plt.title('Distribusi Fare')
plt.xlabel('Fare')
plt.ylabel('Frekuensi')

plt.tight_layout()
plt.show()

if missing_age > 0:
    age_median = df['Age'].median()
    df['Age'] = df['Age'].fillna(age_median)
    print(f"Data 'Age' yang hilang diisi dengan median: {age_median}")

if missing_fare > 0:
    fare_median = df['Fare'].median()
    df['Fare'] = df['Fare'].fillna(fare_median)
    print(f"Data 'Fare' yang hilang diisi dengan median: {fare_median}")

print("\nSetelah imputasi:")
print("Jumlah data yang hilang di 'Age':", df['Age'].isnull().sum()) 
print("Jumlah data yang hilang di 'Fare':", df['Fare'].isnull().sum())  