from flask import Flask, jsonify, request
import pandas as pd
import random
import mysql.connector
from sqlalchemy import create_engine, text
import time
from datetime import timedelta

app = Flask(__name__)

# Fungsi untuk menghubungkan ke database MySQL dengan SQLAlchemy
def connect_db():
    try:
        engine = create_engine('mysql+mysqlconnector://root:@localhost/penjadwalan2')
        print("Connected to the database successfully!")
        return engine
    except Exception as e:
        print(f"Error connecting to MySQL: {e}")
        exit()

# Fungsi untuk menghubungkan ke database dengan mysql.connector
def get_db_connection():
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='',
        database='penjadwal2an2'
    )
    return connection

# Fungsi untuk memuat data dari tabel database berdasarkan tahun akademik
def load_data_from_db(tahun_akademik_id=None):
    engine = connect_db()
    query = '''
    SELECT dm.*, d.nama_dosen, m.nama_matkul, p.nama_prodi, p.jurusan, ta.tahun_akademik_nama
    FROM dosen_mk dm
    JOIN dosen d ON dm.dosen_id = d.dosen_id
    JOIN matakuliah m ON dm.matkul_id = m.matkul_id
    JOIN prodi p ON dm.prodi_id = p.prodi_id
    JOIN tahun_akademik ta ON dm.tahun_akademik_id = ta.tahun_akademik_id
    '''

    dosen_mk = pd.read_sql_query(query, engine)
    waktu = pd.read_sql_query('SELECT * FROM waktu', engine)
    kelas = pd.read_sql_query('SELECT * FROM kelas', engine)
    ruangan = pd.read_sql_query('SELECT * FROM ruangan', engine)
    return dosen_mk, waktu, kelas, ruangan


# Fungsi untuk membuat populasi awal secara random
def initialize_population(dosen_mk, waktu, kelas, ruangan, population_size=100):
    population = []
    for _ in range(population_size):
        individual = []
        for _, row in dosen_mk.iterrows():
            # Filter kelas yang sesuai dengan prodi_id
            valid_kelas = kelas[kelas['prodi_id'] == row['prodi_id']]  # Pilih kelas yang sesuai dengan prodi_id
            kelas_sample = valid_kelas.sample(1).iloc[0].to_dict()  # Pilih kelas secara acak dari kelas yang valid
            
            waktu_sample = waktu.sample(1).iloc[0].to_dict()
            ruangan_sample = ruangan.sample(1).iloc[0].to_dict()
            
            individual.append({
                'dosen_id': row['dosen_id'],
                'matkul_id': row['matkul_id'],
                'prodi_id': row['prodi_id'],
                'tahun_akademik_id': row['tahun_akademik_id'],
                'waktu': waktu_sample,
                'kelas': kelas_sample,
                'ruangan': ruangan_sample,
            })
        population.append(individual)
    return population


# Fungsi untuk menghitung fitness (menghindari bentrok)
def calculate_fitness(individual):
    conflicts = 0
    schedule = []

    for entry in individual:
        waktu = entry['waktu']
        kelas = entry['kelas']
        ruangan = entry['ruangan']

        for s in schedule:
            if (s['waktu']['waktu_id'] == waktu['waktu_id'] and 
                (s['ruangan']['ruangan_id'] == ruangan['ruangan_id'] or 
                 s['kelas']['kelas_id'] == kelas['kelas_id'])):
                conflicts += 1
        schedule.append({
            'waktu': waktu,
            'kelas': kelas,
            'ruangan': ruangan,
        })

    return 1 / (1 + conflicts)  # Nilai fitness semakin tinggi jika konflik semakin sedikit

# Fungsi seleksi berdasarkan fitness
def selection(population):
    population = sorted(population, key=lambda ind: calculate_fitness(ind), reverse=True)
    return population[:len(population)//2]  # Ambil separuh terbaik

# Fungsi crossover untuk menghasilkan keturunan baru
def crossover(parent1, parent2):
    point = random.randint(0, len(parent1) - 1)
    child1 = parent1[:point] + parent2[point:]
    child2 = parent2[:point] + parent1[point:]
    return child1, child2

def mutate(individual, waktu, kelas, ruangan, mutation_rate=0.1):
    for entry in individual:
        if random.random() < mutation_rate:
            entry['waktu'] = waktu.sample(1).iloc[0].to_dict()
        if random.random() < mutation_rate:
            # Filter kelas yang sesuai dengan prodi_id
            valid_kelas = kelas[kelas['prodi_id'] == entry['prodi_id']]  # Filter kelas berdasarkan prodi_id
            entry['kelas'] = valid_kelas.sample(1).iloc[0].to_dict()
        if random.random() < mutation_rate:
            entry['ruangan'] = ruangan.sample(1).iloc[0].to_dict()


# Algoritma genetika utama
def genetic_algorithm(dosen_mk, waktu, kelas, ruangan, generations=100, population_size=100, max_duration=300):
    population = initialize_population(dosen_mk, waktu, kelas, ruangan, population_size)
    start_time = time.time()

    for generation in range(generations):
        # Cek apakah waktu sudah melebihi max_duration
        if time.time() - start_time > max_duration:
            print("Timeout reached, stopping algorithm.")
            break
        
        population = selection(population)
        next_generation = []
        while len(next_generation) < population_size:
            parent1, parent2 = random.sample(population, 2)
            child1, child2 = crossover(parent1, parent2)
            next_generation.extend([child1, child2])

        for individual in next_generation:
            mutate(individual, waktu, kelas, ruangan)

        population = next_generation
        best_fitness = max(calculate_fitness(ind) for ind in population)
        print(f'Generation {generation + 1}: Best Fitness = {best_fitness}')

    best_individual = max(population, key=lambda ind: calculate_fitness(ind))
    return best_individual


# Fungsi untuk menyimpan jadwal2 ke database
def save_schedule_to_db(schedule, engine):
    data_to_insert = []
    for entry in schedule:
        waktu = entry['waktu']
        kelas = entry['kelas']
        ruangan = entry['ruangan']
        data_to_insert.append({
            'dosen_id': entry['dosen_id'],
            'matkul_id': entry['matkul_id'],
            'prodi_id': entry['prodi_id'],
            'waktu_id': waktu['waktu_id'],
            'kelas_id': kelas['kelas_id'],
            'ruangan_id': ruangan['ruangan_id'],
            'tahun_akademik_id': int(entry['tahun_akademik_id'])
        })

    try:
        # Memulai koneksi dan melakukan query
        with engine.connect() as conn:
            query = text('''
                INSERT INTO jadwal2 (dosen_id, matkul_id, prodi_id, waktu_id, kelas_id, ruangan_id, tahun_akademik_id)
                VALUES (:dosen_id, :matkul_id, :prodi_id, :waktu_id, :kelas_id, :ruangan_id, :tahun_akademik_id)
            ''')
            conn.execute(query, data_to_insert)
            conn.commit()
            print("Data successfully inserted into database.")
    except Exception as e:
        print(f"Error while inserting data into jadwal22: {e}")


# Helper function to convert Timedelta to string
def timedelta_to_str(td):
    if isinstance(td, timedelta):
        return str(td)
    return td  # Return the value as is if it's not a Timedelta

# Convert all values in the schedule that are Timedelta objects
def convert_schedule_to_serializable(schedule):
    for entry in schedule:
        for key, value in entry.items():
            if isinstance(value, dict):  # Check if value is a dictionary (like 'waktu', 'kelas', 'ruangan')
                for sub_key, sub_value in value.items():
                    entry[key][sub_key] = timedelta_to_str(sub_value)
            else:
                entry[key] = timedelta_to_str(value)
    return schedule

@app.route('/penjadwalan2', methods=['GET'])
def generate_schedule():
    # Get the tahun_akademik_id from the query parameters
    tahun_akademik_id = request.args.get('tahun_akademik_id', type=int)

    # Check if the tahun_akademik_id is provided and valid
    if not tahun_akademik_id:
        return jsonify({"error": "tahun_akademik_id is required and must be a valid integer"}), 400

    try:
        tahun_akademik_id = int(tahun_akademik_id)
    except ValueError:
        return jsonify({"error": "tahun_akademik_id must be a valid integer"}), 400

    # Proceed with the normal flow if the parameter is valid
    start_time = time.time()
    dosen_mk, waktu, kelas, ruangan = load_data_from_db(tahun_akademik_id)
    best_schedule = genetic_algorithm(dosen_mk, waktu, kelas, ruangan)

    # Convert the best_schedule to a serializable format
    best_schedule = convert_schedule_to_serializable(best_schedule)

    # Save the schedule to the database
    save_schedule_to_db(best_schedule, connect_db())

    duration = time.time() - start_time

    # Return the best schedule as a JSON response
    return jsonify(best_schedule)

if __name__ == '__main__':

    app.run(debug=True)
