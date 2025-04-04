import pandas as pd
import numpy as np
import statsmodels.api as sm
import matplotlib.pyplot as plt
import seaborn as sns
from matplotlib.ticker import PercentFormatter
from sklearn.metrics import mean_squared_error, r2_score
from statsmodels.stats.outliers_influence import variance_inflation_factor
from sklearn.preprocessing import StandardScaler

# Fungsi konversi persentase
def percent_to_float(x):
    """Mengubah string persentase ke float"""
    if isinstance(x, str):
        return float(x.strip('%'))/100
    return x

# 1. Memuat dan mempersiapkan data
def load_and_prepare_data():
    """Memuat dan membersihkan data"""
    data = pd.read_csv('NBA_2024_Western_Conference_Standing.csv')
    
    # Membersihkan missing values
    data_clean = data.copy()
    numeric_cols = data.select_dtypes(include=[np.number]).columns
    data_clean[numeric_cols] = data_clean[numeric_cols].fillna(data_clean[numeric_cols].median())
    
    # Konversi persentase
    pct_cols = ['Playoffs', 'W/L%']
    for col in pct_cols:
        data_clean[col] = data_clean[col].apply(percent_to_float)
    
    # Memisahkan kolom Current
    data_clean[['Current_W', 'Current_L']] = data_clean['Current'].str.split('-', expand=True).astype(float)
    
    return data_clean

# 2. Analisis regresi utama
def run_regression_analysis(data_clean):
    """Menjalankan analisis regresi lengkap"""
    # Memilih variabel
    X = data_clean[['W', 'W/L%', 'SRS', 'Current_W', '1-6']].astype(float)
    y = data_clean['Playoffs'].astype(float)
    
    # Standardisasi data
    scaler = StandardScaler()
    X_scaled = scaler.fit_transform(X)
    X_scaled = pd.DataFrame(X_scaled, columns=X.columns)
    
    # Menambahkan konstanta
    X_const = sm.add_constant(X_scaled)
    
    # Analisis Regresi
    model = sm.OLS(y, X_const).fit()
    y_pred = model.predict(X_const)
    
    return X, y, X_scaled, X_const, model, y_pred, scaler

# 3. Interpretasi hasil regresi
def interpret_results(model, X_scaled, y, y_pred, data_clean):
    """Melakukan interpretasi hasil regresi"""
    # Menghitung metrik evaluasi
    mse = mean_squared_error(y, y_pred)
    r2 = r2_score(y, y_pred)
    
    print("\n" + "="*80)
    print("INTERPRETASI HASIL REGRESI")
    print("="*80)
    
    # 1. Intercept (konstanta)
    intercept = model.params['const']
    print(f"1. Intercept (konstanta): {intercept:.4f}")
    print("   - Merupakan nilai prediksi ketika semua variabel independen bernilai 0")
    
    # 2. Slope (koefisien regresi)
    print("\n2. Slope (Koefisien Regresi):")
    for var in X_scaled.columns:
        coef = model.params[var]
        pval = model.pvalues[var]
        sig = "signifikan" if pval < 0.05 else "tidak signifikan"
        print(f"   - {var}: {coef:.4f} ({sig}, p-value={pval:.4f})")
    
    # 3. Koefisien determinasi (R-squared)
    print(f"\n3. Koefisien Determinasi (R²): {r2:.4f}")
    print(f"   - Model ini menjelaskan {r2*100:.2f}% variasi dalam probabilitas playoff")
    
    # 4. Mean Squared Error (MSE)
    print(f"\n4. Mean Squared Error (MSE): {mse:.6f}")
    print("   - Semakin kecil nilai MSE, semakin akurat model dalam memprediksi")
    
    # 5. Daftar tim yang diprediksi masuk playoff
    print("\n5. Daftar Tim yang Diprediksi Masuk Playoff:")
    playoff_teams = data_clean.copy()
    playoff_teams['Predicted_Playoff_Prob'] = y_pred
    playoff_teams = playoff_teams.sort_values('Predicted_Playoff_Prob', ascending=False)
    
    # Ambil 8 tim teratas (standar NBA)
    top_8 = playoff_teams.head(8)[['Western Conference', 'Predicted_Playoff_Prob']]
    
    for i, (team, prob) in enumerate(zip(top_8['Western Conference'], top_8['Predicted_Playoff_Prob']), 1):
        print(f"   {i}. {team}: {prob:.1%}")

# 4. Visualisasi hasil
def visualize_results(X, y, X_scaled, X_const, model, data_clean, y_pred):
    """Membuat visualisasi hasil analisis"""
    # Membuat DataFrame hasil prediksi
    results = data_clean[['Western Conference', 'W', 'L', 'W/L%', 'Playoffs']].copy()
    results['Predicted_Playoff_Prob'] = y_pred
    results['Predicted_Rank'] = results['Predicted_Playoff_Prob'].rank(ascending=False).astype(int)
    results['Difference'] = results['Predicted_Playoff_Prob'] - results['Playoffs']
    
    # Menyiapkan output
    pd.set_option('display.float_format', '{:.4f}'.format)
    final_output = results.sort_values('Predicted_Rank')[['Predicted_Rank', 'Western Conference', 
                                                        'W', 'L', 'W/L%', 
                                                        'Playoffs', 'Predicted_Playoff_Prob', 
                                                        'Difference']]
    
    # ================ TAMPILAN KOEFISIEN LENGKAP ================
    print("="*80)
    print("HASIL ANALISIS REGRESI LENGKAP")
    print("="*80)
    print(model.summary())
    
    # ================ VISUALISASI KOEFISIEN ================
    coef_df = pd.DataFrame({
        'Variabel': X_const.columns,
        'Koefisien': model.params,
        'p-value': model.pvalues
    }).sort_values('Koefisien')
    
    plt.figure(figsize=(10, 6))
    colors = ['green' if p < 0.05 else 'gray' for p in coef_df['p-value']]
    bars = plt.barh(coef_df['Variabel'], coef_df['Koefisien'], color=colors)
    
    plt.axvline(x=0, color='red', linestyle='--')
    plt.title('Pengaruh Variabel terhadap Probabilitas Playoff\n(Hijau = Signifikan, Abu-abu = Tidak Signifikan)')
    plt.xlabel('Koefisien Regresi (Data Terstandarisasi)')
    plt.ylabel('Variabel')
    plt.grid(axis='x', linestyle='--', alpha=0.7)
    
    # Tambahkan nilai koefisien
    for bar in bars:
        width = bar.get_width()
        plt.text(width/2, bar.get_y() + bar.get_height()/2, 
                 f'{width:.3f}', 
                 ha='center', va='center', color='black')
    
    plt.tight_layout()
    plt.show()
    
    # ================ VISUALISASI PREDIKSI PLAYOFF ================
    plt.figure(figsize=(12, 8))
    
    # Ambil 8 tim teratas
    top_8 = final_output.head(8).sort_values('Predicted_Playoff_Prob', ascending=True)
    
    # Warna berbeda untuk 3 teratas
    colors = ['gold', 'silver', 'peru'] + ['skyblue']*5
    plt.barh(top_8['Western Conference'], top_8['Predicted_Playoff_Prob'], color=colors)
    
    plt.xlabel('Probabilitas Playoff Prediksi')
    plt.title('8 Tim Teratas yang Diprediksi Masuk Playoff 2025')
    plt.xlim(0, 1.05)
    plt.gca().xaxis.set_major_formatter(PercentFormatter(1))
    
    for i, (prob, team) in enumerate(zip(top_8['Predicted_Playoff_Prob'], top_8['Western Conference'])):
        plt.text(prob + 0.01, i, f'{prob:.1%}', va='center')
    
    plt.tight_layout()
    plt.show()
    
    return final_output

# Main execution
def main():
    # 1. Memuat dan mempersiapkan data
    data_clean = load_and_prepare_data()
    
    # 2. Menjalankan analisis regresi
    X, y, X_scaled, X_const, model, y_pred, scaler = run_regression_analysis(data_clean)
    
    # 3. Interpretasi hasil
    interpret_results(model, X_scaled, y, y_pred, data_clean)
    
    # 4. Visualisasi hasil
    final_output = visualize_results(X, y, X_scaled, X_const, model, data_clean, y_pred)
    
    return final_output

if __name__ == "__main__":
    final_results = main()