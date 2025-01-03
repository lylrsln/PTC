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

// Ambil data tahun akademik
$sql_tahun = "SELECT * FROM tahun_akademik"; 
$result_tahun = $conn->query($sql_tahun);

// Ambil data prodi
$sql_prodi = "SELECT * FROM prodi";
$result_prodi = $conn->query($sql_prodi);

// Ambil data pencarian
$search = isset($_GET['search']) ? $conn->real_escape_string($_GET['search']) : '';
$tahun_akademik = isset($_GET['tahun_akademik']) ? $conn->real_escape_string($_GET['tahun_akademik']) : '';
$prodi_id = isset($_GET['prodi_id']) ? $conn->real_escape_string($_GET['prodi_id']) : '';

// Query untuk menampilkan data jadwal dengan nama-nama terkait dan data waktu
$sql = "SELECT j.*, d.nama_dosen, m.nama_matkul, k.nama_kelas, r.nama_ruangan, ta.tahun_akademik_nama, w.hari, w.jam_mulai, w.jam_selesai, p.nama_prodi
        FROM jadwal2 j
        LEFT JOIN dosen d ON j.dosen_id = d.dosen_id
        LEFT JOIN matakuliah m ON j.matkul_id = m.matkul_id
        LEFT JOIN kelas k ON j.kelas_id = k.kelas_id
        LEFT JOIN ruangan r ON j.ruangan_id = r.ruangan_id
        LEFT JOIN tahun_akademik ta ON j.tahun_akademik_id = ta.tahun_akademik_id
        LEFT JOIN waktu w ON j.waktu_id = w.waktu_id
        LEFT JOIN prodi p ON j.prodi_id = p.prodi_id"; // Join dengan tabel prodi untuk mendapatkan nama_prodi

// Tambahkan kondisi untuk tahun akademik, pencarian, dan prodi
if ($tahun_akademik) {
    $sql .= " WHERE ta.tahun_akademik_nama = '$tahun_akademik'";
}
if ($search) {
    $sql .= " AND (d.nama_dosen LIKE '%$search%' OR m.nama_matkul LIKE '%$search%')";
}
if ($prodi_id) {
    $sql .= " AND j.prodi_id = '$prodi_id'";
}

$result = $conn->query($sql);

// Kelompokkan jadwal berdasarkan prodi_id
$jadwal_by_prodi = [];
while ($row = $result->fetch_assoc()) {
    $jadwal_by_prodi[$row['prodi_id']][] = $row;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Manajemen Data Jadwal | Institut Teknologi Bacharuddin Jusuf Habibie</title>
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/dosen.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

    <!-- Script untuk menampilkan prodi berdasarkan tahun akademik -->
    <script>
        function filterProdi() {
            var tahunAkademik = document.getElementById('tahun_akademik').value;
            var prodiSelect = document.getElementById('prodi_id');
            
            // Set semua pilihan prodi menjadi disabled
            for (var i = 0; i < prodiSelect.options.length; i++) {
                prodiSelect.options[i].disabled = true;
            }

            // Enable semua pilihan prodi setelah tahun akademik dipilih
            if (tahunAkademik) {
                // Fetch Prodi berdasarkan Tahun Akademik
                fetch('get_prodi.php?tahun_akademik=' + tahunAkademik)
                    .then(response => response.json())
                    .then(data => {
                        // Clear the previous options
                        prodiSelect.innerHTML = '<option value="">--Pilih Program Studi--</option>';
                        
                        // Add available prodi options
                        data.forEach(function(prodi) {
                            var option = document.createElement('option');
                            option.value = prodi.prodi_id;
                            option.textContent = prodi.nama_prodi;
                            prodiSelect.appendChild(option);
                        });

                        // Enable prodi select
                        prodiSelect.disabled = false;
                    });
            } else {
                // Reset prodi select if no year selected
                prodiSelect.innerHTML = '<option value="">--Pilih Program Studi--</option>';
                prodiSelect.disabled = true;
            }
        }
    </script>
</head>
<body>
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <a class="navbar-brand ps-3" href="index.html">Institut Teknologi Bacharuddin Jusuf Habibie</a>
    </nav>

    <div id="layoutSidenav">
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <br><center><h1>Manajemen Jadwal Dosen</h1></center><br>

                    <form method="GET">
                        <label for="tahun_akademik" class="form-label">Pilih Tahun Akademik</label>
                        <select class="form-select" name="tahun_akademik" id="tahun_akademik" onchange="filterProdi()">
                            <option value="">--Pilih Tahun Akademik--</option>
                            <?php while ($row = $result_tahun->fetch_assoc()) { ?>
                                <option value="<?php echo $row['tahun_akademik_nama']; ?>" <?php echo ($tahun_akademik == $row['tahun_akademik_nama']) ? 'selected' : ''; ?>>
                                    <?php echo $row['tahun_akademik_nama']; ?>
                                </option>
                            <?php } ?>
                        </select>

                        <label for="prodi_id" class="form-label">Pilih Program Studi</label>
                        <select class="form-select" name="prodi_id" id="prodi_id" <?php echo $tahun_akademik ? '' : 'disabled'; ?>>
                            <option value="">--Pilih Program Studi--</option>
                        </select>

                        <label for="search" class="form-label">Cari Dosen atau Mata Kuliah</label>
                        <input type="text" class="form-control" name="search" id="search" value="<?php echo $search; ?>" placeholder="Cari berdasarkan dosen atau mata kuliah">

                        <button type="submit" class="btn btn-primary mt-3">Tampilkan Jadwal</button>
                    </form>

                    <br><center><h2>Daftar Jadwal</h2></center><br>

                    <?php
                    // Menampilkan jadwal per prodi
                    foreach ($jadwal_by_prodi as $prodi_id => $jadwals) {
                        // Ambil nama prodi berdasarkan prodi_id
                        $sql_prodi_name = "SELECT nama_prodi FROM prodi WHERE prodi_id = '$prodi_id'";
                        $result_prodi_name = $conn->query($sql_prodi_name);
                        $prodi_row = $result_prodi_name->fetch_assoc();
                        $prodi_name = $prodi_row['nama_prodi'];
                    ?>
                        <div class="alert alert-info">
                            <strong>Program Studi:</strong> <?php echo $prodi_name; ?>
                        </div>

                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Hari</th>
                                    <th>Jam Mulai</th>
                                    <th>Jam Selesai</th>
                                    <th>Nama Ruangan</th>
                                    <th>Nama Mata Kuliah</th>
                                    <th>Nama Dosen</th>
                                    <th>Nama Kelas</th>
                                    <th>Tahun Akademik</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($jadwals as $row) { ?>
                                    <tr>
                                        <td><?php echo $row['hari']; ?></td>
                                        <td><?php echo $row['jam_mulai']; ?></td>
                                        <td><?php echo $row['jam_selesai']; ?></td>
                                        <td><?php echo $row['nama_ruangan']; ?></td>
                                        <td><?php echo $row['nama_matkul']; ?></td>
                                        <td><?php echo $row['nama_dosen']; ?></td>
                                        <td><?php echo $row['nama_kelas']; ?></td>
                                        <td><?php echo $row['tahun_akademik_nama']; ?></td>
                                        <td>
                                            <a href="edit_jadwal.php?edit_id=<?php echo $row['jadwal_id']; ?>">Edit</a>
                                        </td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    <?php } ?>

                </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>
</html>
