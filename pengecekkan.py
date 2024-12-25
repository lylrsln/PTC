import pandas as pd
import random
from sqlalchemy import create_engine, text
import time

def connect_db():
    try:
        engine = create_engine('mysql+mysqlconnector://root:@localhost/penjadwalan2', echo=False)
        return engine
    except Exception as e:
        print(f"Error: {e}")
        return None

def fetch_data(engine):
    query = """
    SELECT j.jadwal_id, w.hari, w.jam_mulai, w.jam_selesai, r.nama_ruangan, m.nama_matkul, 
           d.nama_dosen, k.nama_kelas, ta.tahun_akademik_nama, p.nama_prodi
    FROM jadwal2 j
    JOIN waktu w ON j.waktu_id = w.waktu_id
    JOIN ruangan r ON j.ruangan_id = r.ruangan_id
    JOIN matakuliah m ON j.matkul_id = m.matkul_id
    JOIN dosen d ON j.dosen_id = d.dosen_id
    JOIN kelas k ON j.kelas_id = k.kelas_id
    JOIN tahun_akademik ta ON j.tahun_akademik_id = ta.tahun_akademik_id
    JOIN prodi p ON j.prodi_id = p.prodi_id
    """
    
    with engine.connect() as connection:
        return pd.read_sql(text(query), connection)

def check_conflicts(schedule):
    conflicts = 0
    for i in range(len(schedule)):
        for j in range(i+1, len(schedule)):
            # Cek apakah ada bentrok waktu atau ruangan yang sama
            if (schedule.iloc[i]['jam_mulai'] < schedule.iloc[j]['jam_selesai'] and 
                schedule.iloc[i]['jam_selesai'] > schedule.iloc[j]['jam_mulai'] and
                schedule.iloc[i]['nama_ruangan'] == schedule.iloc[j]['nama_ruangan']):
                conflicts += 1
    return conflicts

def generate_schedule(engine):
    df = fetch_data(engine)
    schedule = df.sample(frac=1).reset_index(drop=True)  # Acak jadwal
    conflicts = check_conflicts(schedule)
    fitness = 1 / (1 + conflicts)
    return schedule, fitness

def main():
    engine = connect_db()
    if not engine:
        print("Failed to connect to the database.")
        return
    
    # Proses pengambilan data dan pengolahan jadwal
    best_schedule, best_fitness = generate_schedule(engine)
    print(f"Best Fitness: {best_fitness}")
    print(best_schedule.head())

if __name__ == "__main__":
    start_time = time.time()
    main()
    print("Execution Time: %s seconds" % (time.time() - start_time))
