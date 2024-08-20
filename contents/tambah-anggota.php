<?php
if (isset($_POST['simpan'])) {
    // jika param edit ada maka update, selain itu maka tambah
    $id = isset($_GET['edit']) ? $_GET['edit'] : '';


    $nama_lengkap = $_POST['nama_lengkap'];
    $nisn = $_POST['nisn'];
    $jenis_kelamin = $_POST['jenis_kelamin'];
    $no_telp = $_POST['no_telp'];
    $alamat = $_POST['alamat'];

    if (!$id) {
        $queryInsert = mysqli_query($koneksi, "INSERT INTO anggota (nama_lengkap, nisn, jenis_kelamin, no_telp, alamat) VALUES ('$nama_lengkap', '$nisn', '$jenis_kelamin', '$no_telp', '$alamat') ");
    } else {
        $updateKategori = mysqli_query($koneksi, "UPDATE anggota SET  nama_lengkap = '$nama_lengkap',  nisn = '$nisn', jenis_kelamin = '$jenis_kelamin', no_telp = '$no_telp', alamat = '$alamat' WHERE id ='$id' ");
    }
    header("Location:?pg=anggota&tambah=berhasil");
}
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $delete = mysqli_query($koneksi, "DELETE FROM anggota WHERE id = '$id'");
    header("location:?pg=anggota&delete=berhasil");
}
if (isset($_GET['edit'])) {
    $id = $_GET['edit'];
    $edit = mysqli_query($koneksi, "SELECT * FROM anggota WHERE id = '$id'");
    $rowEdit = mysqli_fetch_assoc($edit);
}
?>
<div class="container mt-5">
    <!-- Tabel Kategori -->
    <div class="row justify-content-center">
        <div class="col-sm-8">

            <div class="card">
                <div class="card-header">Data Anggota</div>
                <div class="card-body">
                    <form action="" method="post">
                        <div class="mb-3">
                            <label for="" class="form-label">Nama Lengkap</label>
                            <input value="<?= $rowEdit['nama_lengkap'] ?? '' ?>" type="text" class="form-control" name="nama_lengkap" required>
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">NISN</label>
                            <input value="<?= $rowEdit['nisn'] ?? '' ?>" type="text" class="form-control" name="nisn" required>
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">Jenis Kelamin</label>
                            <select name="jenis_kelamin" id="" class="form-control">
                                <option value="">Pilih Jenis-Kelamin</option>
                                <option value="Laki-laki" <?= isset($rowEdit['jenis_kelamin']) && $rowEdit['jenis_kelamin'] == 'Laki-laki' ? 'selected' : '' ?>>Laki-laki</option>
                                <option value="Perempuan" <?= isset($rowEdit['jenis_kelamin']) && $rowEdit['jenis_kelamin'] == 'Perempuan' ? 'selected' : '' ?>>Perempuan</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">No Telepon</label>
                            <input value="<?= $rowEdit['no_telp'] ?? '' ?>" type="text" class="form-control" name="no_telp" required>
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">Alamat</label>
                            <textarea name="alamat" id="" class="form-control"><?= ($rowEdit['alamat'] ?? '') ?></textarea>
                        </div>
                        <div class="mb-3">
                            <input type="submit" class="btn btn-primary" name="simpan" value="Simpan">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>