import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

data = {
    'Lama Belajar': [100, 0, 14, 42, 90, 20, 38, 18, 22, 10, 10, 23, 35, 39, 23, 2, 21, 1, 23, 43, 
                     29, 37, 1, 20, 32, 11, 21, 43, 24, 48, 26, 41, 27, 15, 14, 46, 50, 43, 2, 36, 
                     50, 6, 20, 8, 38, 17, 3, 24, 13, 49],
    'Nilai Ujian': [94, 83, 100, 10, 67, 89, 91, 75, 64, 57, 57, 92, 95, 82, 55, 41, 76, 54, 85, 83, 
                    90, 94, 55, 80, 100, 73, 76, 100, 69, 97, 62, 85, 88, 58, 71, 100, 100, 100, 43, 92, 
                    100, 45, 83, 76, 100, 53, 56, 77, 70, 100],
    'Kehadiran': [6, 14, 13, 6, 10, 8, 14, 14, 9, 9, 11, 12, 2, 14, 15, 6, 0, 3, 12, 15, 
                  3, 13, 4, 6, 6, 12, 14, 10, 12, 3, 12, 15, 6, 10, 2, 5, 11, 1, 9, 12, 
                  13, 8, 4, 5, 11, 11, 11, 11, 3, 13],
    'Ekstrakurikuler': ['YES', 'NO', 'YES', 'YES', 'NO', 'YES', 'NO', 'NO', 'YES', 'NO', 
                        'NO', 'NO', 'NO', 'YES', 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', 
                        'YES', 'YES', 'NO', 'NO', 'YES', 'NO', 'NO', 'NO', 'YES', 'YES', 
                        'YES', 'NO', 'NO', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'NO', 
                        'YES', 'NO', 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'NO', 'NO'],
    'Usia': [22, 18, 25, 18, 20, 18, 19, 19, 21, 23, 24, 22, 25, 18, 18, 20, 23, 19, 22, 21, 
             19, 25, 23, 25, 24, 21, 24, 20, 25, 20, 18, 24, 23, 25, 22, 21, 19, 23, 23, 20, 
             24, 25, 25, 18, 18, 21, 20, 23, 25, 22]
}
df = pd.DataFrame(data)

print ("1. Identifikasi Variabel: ")
print ("Lama Belajar: Kuantitatif (Kontinu), Independen")
print ("Nilai Ujian: Kuantitatif (Kontinu), Dependen")
print ("Kehadiran: Kuantitatif (Diskrit), Independen")
print ("Ekstrakurikuler: Kualitatif (Nominal), Independen")
print ("Usia: Kuantitatif (Diskrit), Independen")

#a. Bar Chart
plt.figure(figsize=(10,5))
plt.bar(df.index, df['Lama Belajar'], label="Lama Belajar", color='red')
plt.bar(df.index, df['Nilai Ujian'], label="Nilai Ujian", color='blue', alpha=0.5)
plt.legend()
plt.title("Diagram Lama Belajar dan Nilai Ujian")
plt.show()

#b. Tabel Frekuensi
freq_lama = pd.cut(df['Lama Belajar'], bins=[0,20,40,60,80,100]).value_counts().sort_index()
freq_nilai = pd.cut(df['Nilai Ujian'], bins=[0,20,40,60,80,100]).value_counts().sort_index()
print("\Tabel Frekuensi Lama Belajar:", freq_lama)
print("\Tabel Frekuensi Nilai Ujian:", freq_nilai)

# c. Pie Chart
plt.figure(figsize=(12, 5))
plt.subplot(1, 2, 1)
plt.pie(freq_lama, labels=freq_lama.index, autopct="%1.1f%%")  
plt.title('Frekuensi Relatif Lama Belajar')
plt.subplot(1, 2, 2)
plt.pie(freq_nilai, labels=freq_nilai.index, autopct="%1.1f%%")
plt.title('Frekuensi Relatif Nilai Ujian')
plt.show()

#d. Histogram
plt.figure(figsize=(12,5))
plt.subplot(1,2,1)
plt.hist(df['Lama Belajar'], bins=5, color='red')
plt.title('Histogram Lama Belajar')
plt.subplot(1,2,2)
plt.hist(df['Nilai Ujian'], bins=5, color='blue')
plt.title('Histogram Nilai Ujian')
plt.show()

print("3. Kecenderungan Memusat")
for col in ['Lama Belajar', 'Nilai Ujian', 'Kehadiran', 'Usia']:
    print(f"{col}:")
    print(f"Mean: {df[col].mean():.2f}")
    print(f"Median: {df[col].median():.2f}")
    print(f"Modus: {df[col].mode()[0]}")
    
print("4. Variabilitas Data:")
for col in ['Lama Belajar', 'Nilai Ujian']:
    print(f"{col}:")
    print(f"Rentang: {df[col].max() - df[col].min()}")
    print(f"Varians: {df[col].var():.2f}")
    print(f"Simpangan Baku: {df[col].std():.2f}")
    
plt.figure(figsize=(10,5))
plt.boxplot([df['Lama Belajar'], df['Nilai Ujian']], labels=['Lama Belajar', 'Nilai Ujian'])
plt.title('Box Plot Lama Belajar dan Nilai Ujian')
plt.show()