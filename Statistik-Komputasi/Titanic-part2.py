import pandas as pd
import numpy as np
from scipy.stats import norm
import matplotlib.pyplot as plt
import seaborn as sns

# 1. Mengimpor file CSV
file_path = 'd:/College/Semester 4 (kec web)/Statistik-Komputasi/data/Titanic-Dataset.csv'
df = pd.read_csv(file_path)

# 2. Imputasi data yang hilang pada "Age" dengan mean
missing_age = df['Age'].isnull().sum()
print("Jumlah data yang hilang di 'Age' sebelum imputasi:", missing_age)

age_mean = df['Age'].mean()
df['Age'] = df['Age'].fillna(age_mean) 
print(f"Data 'Age' yang hilang diisi dengan mean: {age_mean:.2f}")

# Cek ulang apakah masih ada data yang hilang
print("Jumlah data yang hilang di 'Age' setelah imputasi:", df['Age'].isnull().sum())

# 3. Hitung z-score dari "Age" untuk semua data
# Z-score = (x - mean) / std
age_mean_after_imputation = df['Age'].mean()
age_std_after_imputation = df['Age'].std()
df['Age_Zscore'] = (df['Age'] - age_mean_after_imputation) / age_std_after_imputation

print("\nBeberapa contoh z-score dari 'Age':")
print(df[['Age', 'Age_Zscore']].head())

# 4. Tentukan jumlah outlier dari "Age" (Z > 3 atau Z < -3)
outliers = df[(df['Age_Zscore'] > 3)]
num_outliers = len(outliers)

print(f"\nJumlah outlier dari 'Age' (Z > 3): {num_outliers}")
print("Data outlier:")
print(outliers[['Age', 'Age_Zscore']])

# 5. Asumsikan "Age" terdistribusi normal, hitung peluang "Age" < 20
# P(X < 20) = norm.cdf((20 - mean) / std)
prob_age_less_20 = norm.cdf((20 - age_mean_after_imputation) / age_std_after_imputation)
print(f"\nPeluang 'Age' < 20 (dengan asumsi distribusi normal): {prob_age_less_20:.4f}")