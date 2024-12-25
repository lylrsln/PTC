<?php
// Koneksi ke database
$host = "localhost";
$user = "root";
$pass = "";
$db = "penjadwalan2";

$conn = new mysqli($host, $user, $pass, $db);

// Periksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Fungsi untuk memeriksa apakah ada bentrok jadwal
function is_schedule_conflicting($conn, $new_waktu_id, $new_ruangan_id, $new_dosen_id) {
    // Query untuk memeriksa bentrok
    $check_query = "SELECT * FROM jadwal2 WHERE waktu_id = '$new_waktu_id' 
                    AND (ruangan_id = '$new_ruangan_id' OR dosen_id = '$new_dosen_id')";
    $result = $conn->query($check_query);

    // Jika ada jadwal yang bentrok
    if ($result->num_rows > 0) {
        return true;
    }
    return false;
}

// Proses Edit Jadwal
if (isset($_GET['edit_id'])) {
    $edit_id = $_GET['edit_id'];
    $edit_query = "SELECT j.*, d.nama_dosen, m.nama_matkul, k.nama_kelas, r.nama_ruangan, ta.tahun_akademik_nama, w.hari, w.jam_mulai, w.jam_selesai
                   FROM jadwal2 j
                   LEFT JOIN dosen d ON j.dosen_id = d.dosen_id
                   LEFT JOIN matakuliah m ON j.matkul_id = m.matkul_id
                   LEFT JOIN kelas k ON j.kelas_id = k.kelas_id
                   LEFT JOIN ruangan r ON j.ruangan_id = r.ruangan_id
                   LEFT JOIN tahun_akademik ta ON j.tahun_akademik_id = ta.tahun_akademik_id
                   LEFT JOIN waktu w ON j.waktu_id = w.waktu_id
                   WHERE j.jadwal_id = '$edit_id'";

    $edit_result = $conn->query($edit_query);
    $edit_row = $edit_result->fetch_assoc();

    // Proses penyimpanan perubahan
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $dosen_id = $_POST['dosen_id'];
        $matkul_id = $_POST['matkul_id'];
        $prodi_id = $_POST['prodi_id'];
        $waktu_id = $_POST['waktu_id'];
        $kelas_id = $_POST['kelas_id'];
        $ruangan_id = $_POST['ruangan_id'];
        $tahun_akademik_id = $_POST['tahun_akademik_id'];

        // Validasi input, pastikan tidak ada yang kosong
        if (empty($matkul_id) || empty($prodi_id) || empty($tahun_akademik_id)) {
            echo "Mohon pastikan semua data terisi dengan benar!";
        } else {
            // Mengecek bentrok jadwal menggunakan algoritma genetika
            if (is_schedule_conflicting($conn, $waktu_id, $ruangan_id, $dosen_id)) {
                // Tidak ada bentrok, lakukan pembaruan jadwal
                $update_sql = "UPDATE jadwal2 SET dosen_id = '$dosen_id', matkul_id = '$matkul_id', prodi_id = '$prodi_id', 
                               waktu_id = '$waktu_id', kelas_id = '$kelas_id', ruangan_id = '$ruangan_id', tahun_akademik_id = '$tahun_akademik_id'
                               WHERE jadwal_id = '$edit_id'";

                if ($conn->query($update_sql) === TRUE) {
                    echo "Jadwal berhasil diperbarui!";
                } else {
                    echo "Error: " . $update_sql . "<br>" . $conn->error;
                }
            } else {
                echo "Jadwal bentrok, silakan pilih waktu, ruangan, atau dosen yang lain!";
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Edit Jadwal</title>
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1>Edit Jadwal</h1>

        <form method="POST">
            <!-- Menampilkan nama dosen -->
            <label for="dosen_id">Dosen:</label>
            <select name="dosen_id" id="dosen_id" required>
                <option value="<?php echo $edit_row['dosen_id']; ?>"><?php echo $edit_row['nama_dosen']; ?></option>
                <?php
                // Menampilkan daftar dosen untuk pilihan
                $dosen_query = "SELECT * FROM dosen";
                $dosen_result = $conn->query($dosen_query);
                while ($dosen = $dosen_result->fetch_assoc()) {
                    echo "<option value='" . $dosen['dosen_id'] . "'>" . $dosen['nama_dosen'] . "</option>";
                }
                ?>
            </select>

            <!-- Menampilkan nama mata kuliah -->
            <label for="matkul_id">Mata Kuliah:</label>
            <select name="matkul_id" id="matkul_id" required>
                <option value="<?php echo $edit_row['matkul_id']; ?>"><?php echo $edit_row['nama_matkul']; ?></option>
                <?php
                // Menampilkan daftar mata kuliah untuk pilihan
                $matkul_query = "SELECT * FROM matakuliah";
                $matkul_result = $conn->query($matkul_query);
                while ($matkul = $matkul_result->fetch_assoc()) {
                    echo "<option value='" . $matkul['matkul_id'] . "'>" . $matkul['nama_matkul'] . "</option>";
                }
                ?>
            </select>

            <!-- Menampilkan nama prodi -->
            <label for="prodi_id">Prodi:</label>
            <select name="prodi_id" id="prodi_id" required>
                <option value="<?php echo $edit_row['prodi_id']; ?>"><?php echo $edit_row['prodi_id']; ?></option>
                <?php
                // Menampilkan daftar prodi untuk pilihan
                $prodi_query = "SELECT * FROM prodi";
                $prodi_result = $conn->query($prodi_query);
                while ($prodi = $prodi_result->fetch_assoc()) {
                    echo "<option value='" . $prodi['prodi_id'] . "'>" . $prodi['nama_prodi'] . "</option>";
                }
                ?>
            </select>

            <!-- Menampilkan nama waktu -->
            <label for="waktu_id">Waktu:</label>
            <select name="waktu_id" id="waktu_id" required>
                <option value="<?php echo $edit_row['waktu_id']; ?>"><?php echo $edit_row['hari'] . " - " . $edit_row['jam_mulai'] . " to " . $edit_row['jam_selesai']; ?></option>
                <?php
                // Menampilkan daftar waktu untuk pilihan
                $waktu_query = "SELECT * FROM waktu";
                $waktu_result = $conn->query($waktu_query);
                while ($waktu = $waktu_result->fetch_assoc()) {
                    echo "<option value='" . $waktu['waktu_id'] . "'>" . $waktu['hari'] . " - " . $waktu['jam_mulai'] . " to " . $waktu['jam_selesai'] . "</option>";
                }
                ?>
            </select>

            <!-- Menampilkan nama kelas -->
            <label for="kelas_id">Kelas:</label>
            <input type="text" name="kelas_id" id="kelas_id" value="<?php echo $edit_row['nama_kelas']; ?>" >

            <!-- Menampilkan nama ruangan -->
            <label for="ruangan_id">Ruangan:</label>
            <input type="text" name="ruangan_id" id="ruangan_id" value="<?php echo $edit_row['nama_ruangan']; ?>" >

            <!-- Menampilkan nama tahun akademik -->
            <label for="tahun_akademik_id">Tahun Akademik:</label>
            <select name="tahun_akademik_id" id="tahun_akademik_id" required>
                <option value="<?php echo $edit_row['tahun_akademik_id']; ?>"><?php echo $edit_row['tahun_akademik_nama']; ?></option>
                <?php
                // Menampilkan daftar tahun akademik untuk pilihan
                $ta_query = "SELECT * FROM tahun_akademik";
                $ta_result = $conn->query($ta_query);
                while ($ta = $ta_result->fetch_assoc()) {
                    echo "<option value='" . $ta['tahun_akademik_id'] . "'>" . $ta['tahun_akademik_nama'] . "</option>";
                }
                ?>
            </select>

            <input type="submit" value="Simpan Perubahan">
        </form>
    </div>
</body>
</html>
