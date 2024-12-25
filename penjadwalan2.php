<?php
// Koneksi ke database MySQL
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "penjadwalan2";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Mendapatkan tahun akademik yang dipilih dari URL atau set default (misal tahun akademik ID 1)
$tahun_akademik_id = isset($_GET['tahun_akademik_id']) ? $_GET['tahun_akademik_id'] : 1; // Default ID 1

// Fetching data dari Flask API (URL untuk Flask API)
$flask_url = "http://127.0.0.1:5000/penjadwalan2?tahun_akademik_id=$tahun_akademik_id";  // URL untuk Flask API

// Inisialisasi cURL session untuk berinteraksi dengan Flask API
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $flask_url);  // URL ke Flask API
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);  // Mengembalikan respons alih-alih mencetaknya
curl_setopt($ch, CURLOPT_TIMEOUT, 10);  // Set timeout untuk cURL request (10 detik)
$response = curl_exec($ch);  // Eksekusi request cURL

// Cek jika terjadi error saat mengambil data dari Flask API
if (curl_errno($ch)) {
    die('Error fetching data from Flask API: ' . curl_error($ch));
}

curl_close($ch);  // Tutup sesi cURL

// Ganti 'NaN' dengan 'null' dalam respons JSON menggunakan preg_replace
$response = preg_replace_callback('/"NaN"/', function ($matches) {
    return '"null"';  // Mengganti NaN dengan null dalam JSON
}, $response);

// Menampilkan respons JSON untuk debugging (opsional)
echo "<pre>";
echo htmlspecialchars($response);  // Menampilkan JSON yang telah diubah
echo "</pre>";

// Mendekode respons JSON setelah perubahan
$data = json_decode($response, true);

// Memeriksa error decoding JSON
if (json_last_error() !== JSON_ERROR_NONE) {
    die('Error decoding JSON response from Flask API: ' . json_last_error_msg());
}

// Urutan hari yang diinginkan (dimulai dari Senin)
$urutan_hari = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat'];

// Mengambil data waktu (hari dan jam mulai-jam selesai) berdasarkan tahun_akademik_id
$sql_waktu = "
    SELECT * 
    FROM waktu 
    ORDER BY FIELD(hari, 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat'), jam_mulai
";
$result_waktu = $conn->query($sql_waktu);

// Mengambil data ruangan
$sql_ruangan = "SELECT * FROM ruangan";
$result_ruangan = $conn->query($sql_ruangan);

$sql_jadwal = "
    SELECT 
        dm.jadwal_id, 
        dm.dosen_id, 
        dm.matkul_id, 
        dm.waktu_id, 
        dm.kelas_id, 
        dm.ruangan_id, 
        dm.tahun_akademik_id, 
        dm.prodi_id,
        d.nama_dosen, 
        m.nama_matkul, 
        p.nama_prodi, 
        p.jurusan, 
        ta.tahun_akademik_nama, 
        w.hari, 
        w.jam_mulai, 
        w.jam_selesai, 
        k.nama_kelas, 
        r.nama_ruangan
    FROM jadwal2 dm
    JOIN dosen d ON dm.dosen_id = d.dosen_id
    JOIN matakuliah m ON dm.matkul_id = m.matkul_id
    JOIN prodi p ON dm.prodi_id = p.prodi_id
    JOIN tahun_akademik ta ON dm.tahun_akademik_id = ta.tahun_akademik_id
    JOIN waktu w ON dm.waktu_id = w.waktu_id
    JOIN kelas k ON dm.kelas_id = k.kelas_id
    JOIN ruangan r ON dm.ruangan_id = r.ruangan_id
";

// Eksekusi query
$result_jadwal = $conn->query($sql_jadwal);


$sql_tahun_akademik = "
    SELECT 
        dm.tahun_akademik_id, 
        ta.tahun_akademik_nama
    FROM dosen_mk dm
    JOIN tahun_akademik ta ON dm.tahun_akademik_id = ta.tahun_akademik_id;

";

// Menjalankan query untuk mendapatkan data tahun akademik
$result_tahun_akademik = $conn->query($sql_tahun_akademik);

// Periksa apakah query berhasil dijalankan
if ($result_tahun_akademik === false) {
    // Jika query gagal, tampilkan pesan error
    die("Terjadi kesalahan saat menjalankan query: " . $conn->error);
}

$tahun_akademik_nama = '';

// Ambil hasil dari query
if ($result_tahun_akademik->num_rows > 0) {
    // Jika ada data, ambil hasilnya
    $row = $result_tahun_akademik->fetch_assoc();
    $tahun_akademik_nama = $row['tahun_akademik_nama'];
} else {
    // Jika tidak ada data yang ditemukan
    die("Tidak ada data ditemukan untuk tahun akademik.");
}

// Membaca data ruangan ke dalam array
$ruangan_arr = [];
while ($row = $result_ruangan->fetch_assoc()) {
    $ruangan_arr[$row['ruangan_id']] = $row['nama_ruangan'];
}

// Membaca data waktu (hari dan jam) ke dalam array
$waktu_arr = [];
while ($row = $result_waktu->fetch_assoc()) {
    $waktu_arr[$row['waktu_id']] = [
        'hari' => $row['hari'],
        'jam_mulai' => $row['jam_mulai'],
        'jam_selesai' => $row['jam_selesai'],
    ];
}

// Membaca data dosen ke dalam array
$dosen_arr = [];
$sql_dosen = "
    SELECT dosen_id, nama_dosen
    FROM dosen
    ORDER BY nama_dosen
";  
$result_dosen = $conn->query($sql_dosen);
if ($result_dosen->num_rows > 0) {
    while ($row = $result_dosen->fetch_assoc()) {
        $dosen_arr[$row['dosen_id']] = $row['nama_dosen'];
    }
}

// Membaca data prodi ke dalam array
$prodi_arr = [];
$sql_prodi = "
    SELECT prodi_id, nama_prodi
    FROM prodi
    ORDER BY nama_prodi
";  
$result_prodi = $conn->query($sql_prodi);
if ($result_prodi->num_rows > 0) {
    while ($row = $result_prodi->fetch_assoc()) {
        $prodi_arr[$row['prodi_id']] = $row['nama_prodi'];
    }
}

// Membaca data mata kuliah ke dalam array
$matkul_arr = [];
$sql_matkul = "
    SELECT matkul_id, nama_matkul  
    FROM matakuliah
    ORDER BY nama_matkul";  
$result_matkul = $conn->query($sql_matkul);
if ($result_matkul->num_rows > 0) {
    while ($row = $result_matkul->fetch_assoc()) {
        $matkul_arr[$row['matkul_id']] = $row['nama_matkul'];
    }
} else {
    echo "Tidak ada mata kuliah ditemukan.";  // Pesan jika tidak ada data yang ditemukan
}

// Mengambil data kelas
$sql_kelas = "
    SELECT kelas_id, nama_kelas  
    FROM kelas
    ORDER BY nama_kelas";
$result_kelas = $conn->query($sql_kelas);
$kelas_arr = [];
if ($result_kelas->num_rows > 0) {
    while ($row = $result_kelas->fetch_assoc()) {
        $kelas_arr[$row['kelas_id']] = $row['nama_kelas'];
    }
} else {
    echo "Tidak ada kelas ditemukan.";  // Pesan jika tidak ada data kelas yang ditemukan
}

// Menginisialisasi matriks berdasarkan waktu dan ruangan
$matriks_jadwal = [];
foreach ($waktu_arr as $waktu) {
    foreach ($ruangan_arr as $ruangan_id => $ruangan) {
        // Inisialisasi dengan nilai kosong (kelas, dosen, matkul)
        $matriks_jadwal[$waktu['hari']][$waktu['jam_mulai']][$ruangan_id] = [
            'kelas_id' => "",
            'dosen_id' => "",
            'matkul_id' => "",
            'prodi_id' => ""
        ];
    }
}

// Mengisi matriks dengan data jadwal
while ($row = $result_jadwal->fetch_assoc()) {
    $waktu_id = $row['waktu_id']; // Waktu yang diambil dari jadwal2
    $kelas_id = $row['kelas_id'];
    $dosen_id = $row['dosen_id'];
    $matkul_id = $row['matkul_id'];
    $prodi_id = $row['prodi_id'];
    $ruangan_id = $row['ruangan_id'];

    // Ambil informasi waktu dari tabel waktu berdasarkan waktu_id
    if (isset($waktu_arr[$waktu_id])) {
        $hari = $waktu_arr[$waktu_id]['hari'];
        $jam_mulai = $waktu_arr[$waktu_id]['jam_mulai'];
        $jam_selesai = $waktu_arr[$waktu_id]['jam_selesai'];

        // Mengisi matriks sesuai dengan jadwal yang ada
        if (isset($matriks_jadwal[$hari][$jam_mulai][$ruangan_id])) {
            // Mengubah kelas_id menjadi nama kelas
            $nama_kelas = isset($kelas_arr[$kelas_id]) ? $kelas_arr[$kelas_id] : 'Tidak ada kelas';
            
            $matriks_jadwal[$hari][$jam_mulai][$ruangan_id] = [
                'kelas' => $nama_kelas,
                'dosen_id' => $dosen_id,
                'matkul_id' => $matkul_id,
                'prodi_id' => $prodi_id
            ];
        }
    }
}

// Menampilkan tahun akademik sebagai judul di tengah halaman
echo "<h2 style='text-align: center;'>Roster: $tahun_akademik_nama</h2>";

// Menampilkan matriks jadwal dalam bentuk tabel HTML
echo "<table border='1' cellpadding='10' cellspacing='0' style='border-collapse: collapse; width: 100%;'>";
echo "<tr><th>Hari</th><th>Jam</th>"; // Menambahkan kolom Hari dan Jam

// Tampilkan nama-nama ruangan di kolom
foreach ($ruangan_arr as $ruangan) {
    echo "<th>$ruangan</th>";
}
echo "</tr>";

// Tampilkan baris-baris waktu dan jadwal berdasarkan urutan hari
foreach ($urutan_hari as $hari) {
    $hari_pertama = true; // Flag untuk mengecek jika hari pertama kali muncul

    // Tampilkan baris untuk setiap jam yang ada pada hari ini
    foreach ($waktu_arr as $waktu) {
        if ($waktu['hari'] == $hari) {
            echo "<tr>";

            // Tampilkan nama hari hanya pada baris pertama
            if ($hari_pertama) {
                echo "<td rowspan='6'>{$waktu['hari']}</td>"; // Menampilkan hari di kolom pertama untuk 6 waktu
                $hari_pertama = false; // Set flag untuk baris berikutnya
            }

            // Tampilkan jam mulai dan jam selesai
            echo "<td>{$waktu['jam_mulai']} - {$waktu['jam_selesai']}</td>";

            // Tampilkan jadwal per ruangan
            foreach ($ruangan_arr as $ruangan_id => $ruangan) {
                $jadwal = $matriks_jadwal[$waktu['hari']][$waktu['jam_mulai']][$ruangan_id];

                // Menampilkan jadwal dengan nama kelas, nama dosen, dan nama matkul
                if (!empty($jadwal['kelas'])) {
                    echo "<td>{$jadwal['kelas']}<br>Dosen: " . $dosen_arr[$jadwal['dosen_id']] . "<br>Matkul: " . $matkul_arr[$jadwal['matkul_id']] . "</td>";
                } else {
                    echo "<td>-</td>";
                }
            }

            echo "</tr>";
        }
    }
}

echo "</table>";
?>

<!-- Tombol untuk mencetak -->
<button onclick="window.print()">Cetak Jadwal</button>
