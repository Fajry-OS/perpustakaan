<?php
if (isset($_POST['simpan'])) {
    // jika param edit ada maka update, selain itu maka tambah
    $id = isset($_GET['edit']) ? $_GET['edit'] : '';


    $judul = $_POST['judul'];
    $jumlah = $_POST['jumlah'];
    $penerbit = $_POST['penerbit'];
    $tahun_terbit = $_POST['tahun_terbit'];
    $penulis = $_POST['penulis'];
    $id_kategori = $_POST['id_kategori'];

    if (!$id) {
        $queryInsert = mysqli_query($koneksi, "INSERT INTO book (judul, jumlah, penerbit, tahun_terbit, penulis, id_kategori) VALUES ('$judul', '$jumlah','$penerbit', '$tahun_terbit','$penulis', '$id_kategori')");
        header("Location:?pg=buku&tambah=berhasil");
    } else {
        $updateBook = mysqli_query($koneksi, "UPDATE book SET  judul = '$judul', jumlah = '$jumlah', penerbit = '$penerbit', tahun_terbit = '$tahun_terbit',penulis = '$penulis', id_kategori = '$id_kategori' WHERE id ='$id' ");
        header("Location:?pg=buku&edit=berhasil");
    }
}

if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $delete = mysqli_query($koneksi, "DELETE FROM book WHERE id = '$id'");
    header("location:?pg=buku&delete=berhasil");
}
if (isset($_GET['edit'])) {
    $id = $_GET['edit'];
    $edit = mysqli_query($koneksi, "SELECT * FROM book WHERE id = '$id'");
    $rowEdit = mysqli_fetch_assoc($edit);
}


$kategori = mysqli_query($koneksi, "SELECT * FROM kategori ORDER BY id DESC");

?>
<div class="container mt-5">

    <div class="row justify-content-center">
        <div class="col-sm-8">

            <div class="card">
                <div class="card-header">Data Buku</div>
                <div class="card-body">
                    <form action="" method="post">
                        <div class="mb-3">
                            <label for="" class="form-label">Genre</label>
                            <select name="id_kategori" id="" class="form-control">
                                <option value="">Pilih Kategori</option>
                                <!-- Memakai while karena ingin semua data muncul dan tidak memerlukan index,
                                jika ada index seperti $row[] = $level gunakan foreach -->
                                <?php while ($rowKategori  = mysqli_fetch_assoc($kategori)) : ?>
                                    <option <?= isset($rowEdit['id_kategori']) ? ($rowEdit['id_kategori'] == $rowKategori['id']) ? 'selected' : '' : '' ?> value="<?= $rowKategori['id'] ?>"><?= $rowKategori['nama_kategori'] ?></option>
                                <?php endwhile ?>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">Judul Buku</label>
                            <input value="<?= $rowEdit['judul'] ?? '' ?>" type="text" class="form-control" name="judul" required>
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">Jumlah Buku</label>
                            <input value="<?= $rowEdit['jumlah'] ?? '' ?>" type="text" class="form-control" name="jumlah" required>
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">Penerbit</label>
                            <input value="<?= $rowEdit['penerbit'] ?? '' ?>" type="text" class="form-control" name="penerbit" required>
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">Tahun Terbit</label>
                            <input value="<?= $rowEdit['tahun_terbit'] ?? '' ?>" type="text" class="form-control" name="tahun_terbit" required>
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">Penulis</label>
                            <input value="<?= $rowEdit['penulis'] ?? '' ?>" type="text" class="form-control" name="penulis" required>
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