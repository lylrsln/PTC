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
// Fetching data from Flask API (assuming Flask is running at http://127.0.0.1:5000)
$flask_url = 'http://127.0.0.1:5000/penjadwalan2';  // URL for Flask API

// Initialize cURL session to interact with Flask API
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $flask_url);  // URL to the Flask API
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);  // Return response instead of printing
curl_setopt($ch, CURLOPT_TIMEOUT, 10);  // Set a timeout for the cURL request (10 seconds)
$response = curl_exec($ch);  // Execute cURL request

// Check if there was an error with the cURL request
if (curl_errno($ch)) {
    die('Error fetching data from Flask API: ' . curl_error($ch));
}

curl_close($ch);  // Close cURL session

// Decode JSON response
$data = json_decode($response, true);

// Cek error decoding JSON
if (json_last_error() !== JSON_ERROR_NONE) {
    die('Error decoding JSON response from Flask API: ' . json_last_error_msg());
}

// Fungsi untuk mendapatkan nama tahun akademik berdasarkan ID
function getNamaTahun($tahun_akademik_id, $conn) {
    $query = "SELECT tahun_akademik_nama FROM tahun_akademik WHERE tahun_akademik_id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $tahun_akademik_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        return $row['tahun_akademik_nama'];
    } else {
        return "Tahun Tidak Ditemukan";
    }
}

// Fungsi untuk mendapatkan daftar tahun akademik
function getTahunAkademik($conn) {
    $query = "SELECT tahun_akademik_id, tahun_akademik_nama FROM tahun_akademik";
    $result = $conn->query($query);
    return $result;
}

// Menyimpan tahun akademik yang dipilih dari URL jika ada
$tahun_akademik = isset($_POST['tahun_akademik']) ? $_POST['tahun_akademik'] : '';

$tahun_akademik_list = getTahunAkademik($conn); // Ambil daftar tahun akademik
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Pilih Tahun Akademik</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form method="GET" action="penjadwalan2.php?tahun_akademik_id=">
        <label for="tahun_akademik">Pilih Tahun Akademik:</label>
        <select name="tahun_akademik_id" id="tahun_akademik" class="form-control">
            <?php
            // Mengambil daftar tahun akademik dari database
            $sql_tahun_akademik = "SELECT tahun_akademik_id, tahun_akademik_nama FROM tahun_akademik ORDER BY tahun_akademik_nama";
            $result_tahun_akademik = $conn->query($sql_tahun_akademik);

            if ($result_tahun_akademik->num_rows > 0) {
                while ($row = $result_tahun_akademik->fetch_assoc()) {
                    $selected = ($row['tahun_akademik_id'] == $tahun_akademik) ? 'selected' : ''; // Menandai tahun yang dipilih
                    echo "<option value='" . $row['tahun_akademik_id'] . "' $selected>" . $row['tahun_akademik_nama'] . "</option>";
                }
            } else {
                echo "<option value=''>Tidak ada tahun akademik</option>";
            }
            ?>
        </select>
        <!-- Tombol untuk submit -->
        <button type="submit" class="btn btn-primary mt-3">Buat Jadwal</button>
    </form>

        <?php
        // Jika ada tahun akademik yang dipilih, tampilkan nama tahun akademik
        if (!empty($tahun_akademik)) {
            $tahun_nama = getNamaTahun($tahun_akademik, $conn);
            echo "<p class='mt-4'>Tahun Akademik Terpilih: $tahun_nama</p>";
        }
        ?>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<?php
// Tutup koneksi database
$conn->close();
?>
