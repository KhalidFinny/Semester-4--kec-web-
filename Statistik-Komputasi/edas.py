# Data Kriteria
kriteria = ["K1", "K2", "K3", "K4", "K5", "K6", "K7", "K8"]
bobot = [0.2904, 0.1708, 0.2133, 0.0441, 0.1399, 0.0293, 0.0498, 0.0624]
jenis_kriteria = ["benefit", "cost", "benefit", "benefit", "benefit", "benefit", "benefit", "benefit"]

# Matriks Keputusan
matriks_keputusan = [
    [7, 7, 9, 7, 1, 9, 1, 6],  # A1
    [4, 3, 5, 3, 3, 10, 7, 4],  # A2
    [5, 5, 7, 4, 9, 2, 6, 1],   # A3
    [9, 5, 10, 9, 7, 8, 6, 7],  # A4
    [10, 1, 9, 2, 10, 6, 10, 2], # A5
    [6, 7, 2, 7, 10, 2, 8, 7],  # A6
    [10, 9, 10, 2, 6, 7, 10, 4], # A7
    [7, 6, 6, 4, 7, 2, 3, 9],   # A8
    [4, 9, 9, 1, 6, 1, 6, 1],   # A9
    [9, 8, 2, 4, 5, 3, 2, 5],   # A10
    [4, 4, 2, 5, 4, 10, 6, 5],  # A11
    [10, 6, 9, 9, 10, 10, 2, 6], # A12
    [6, 8, 8, 5, 4, 9, 2, 3],   # A13
    [8, 6, 3, 3, 6, 7, 8, 7],   # A14
    [4, 9, 3, 5, 10, 5, 10, 6], # A15
    [6, 2, 7, 6, 5, 6, 5, 9],   # A16
    [8, 4, 1, 8, 3, 10, 7, 4],  # A17
    [4, 1, 8, 5, 10, 5, 2, 6],  # A18
    [9, 8, 9, 5, 1, 3, 10, 6],  # A19
    [3, 1, 10, 4, 7, 5, 10, 8]  # A20
]

# Hitung Average Solution (AV)
n_alternatif = len(matriks_keputusan)  # 20 alternatif
n_kriteria = len(kriteria)  # 8 kriteria
AV = []
for j in range(n_kriteria):
    total = sum(matriks_keputusan[i][j] for i in range(n_alternatif))
    AV.append(total / n_alternatif)

# Hitung PDA dan NDA
PDA = []
NDA = []
for i in range(n_alternatif):
    pda_row = []
    nda_row = []
    for j in range(n_kriteria):
        x_ij = matriks_keputusan[i][j]
        av_j = AV[j]
        if jenis_kriteria[j] == "benefit":
            pda = max(0, (x_ij - av_j)) / av_j
            nda = max(0, (av_j - x_ij)) / av_j
        else:  # cost
            pda = max(0, (av_j - x_ij)) / av_j
            nda = max(0, (x_ij - av_j)) / av_j
        pda_row.append(pda)
        nda_row.append(nda)
    PDA.append(pda_row)
    NDA.append(nda_row)

# Hitung SP dan SN
SP = []
SN = []
for i in range(n_alternatif):
    sp = sum(PDA[i][j] * bobot[j] for j in range(n_kriteria))
    sn = sum(NDA[i][j] * bobot[j] for j in range(n_kriteria))
    SP.append(sp)
    SN.append(sn)

# Normalisasi SP dan SN (NSP dan NSN)
max_sp = max(SP)
max_sn = max(SN)
NSP = [sp / max_sp for sp in SP]
NSN = [1 - (sn / max_sn) for sn in SN]

# Hitung Skor Penilaian (AS)
AS = [(nsp + nsn) / 2 for nsp, nsn in zip(NSP, NSN)]

# Perangkingan
alternatif = [f"A{i+1}" for i in range(n_alternatif)]
ranking = sorted(zip(alternatif, AS), key=lambda x: x[1], reverse=True)

# Cetak Hasil
def main():
    print(">>> Menghitung AV")
    print("AV:", [round(av, 3) for av in AV])
    
    print("\n>>> Menghitung PDA (contoh untuk A1)")
    print("PDA A1:", [round(p, 3) for p in PDA[0]])
    
    print("\n>>> Menghitung NDA (contoh untuk A1)")
    print("NDA A1:", [round(n, 3) for n in NDA[0]])
    
    print("\n>>> Menghitung SP dan SN")
    print("SP:", [round(sp, 3) for sp in SP])
    print("SN:", [round(sn, 3) for sn in SN])
    
    print("\n>>> Menghitung NSP dan NSN")
    print("NSP:", [round(nsp, 3) for nsp in NSP])
    print("NSN:", [round(nsn, 3) for nsn in NSN])
    
    print("\n>>> Menghitung AS")
    print("AS:", [round(as_, 3) for as_ in AS])
    
    print("\n>>> Ranking Alternatif")
    for rank, (alt, as_) in enumerate(ranking, 1):
        print(f"Rank {rank}: {alt} (AS: {round(as_, 3)})")
    
    print("\n>>> Alternatif Terbaik")
    print(f"Alternatif terbaik: {ranking[0][0]} dengan AS: {round(ranking[0][1], 3)}")

if __name__ == "__main__":
    main()