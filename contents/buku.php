<?php
// $queryUser = mysqli_query($koneksi, "SELECT * FROM user ORDER BY id DESC");
$queryBook = mysqli_query($koneksi, "SELECT kategori.nama_kategori, book.* FROM book LEFT JOIN kategori ON kategori.id = book.id_kategori ORDER BY id DESC");

?>

<div class="container mt-5">
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header">Master Book</div>
                <div class="card-body">
                    <div align="right" class="mb-3">
                        <a href="?pg=tambah-buku" class="btn btn-primary">Tambah</a>
                    </div>
                    <?php if (isset($_GET['tambah'])) : ?>
                        <div class="alert alert-success">Data Berhasil Ditambah</div>
                    <?php endif ?>
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Kategori</th>
                                <th>Judul</th>
                                <th>Penulis</th>
                                <th>Penerbit</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 1;
                            while ($rowBook = mysqli_fetch_assoc($queryBook)) : ?>
                                <tr>
                                    <td><?= $no++ ?></td>
                                    <td><?= $rowBook['nama_kategori'] ?></td>
                                    <td><?= $rowBook['judul'] ?></td>
                                    <td><?= $rowBook['penulis'] ?></td>
                                    <td><?= $rowBook['penerbit'] ?></td>
                                    <td>
                                        <a class="btn btn-sm btn-warning" href="?pg=tambah-buku&edit=<?= $rowBook['id'] ?>">Edit</a>
                                        <a onclick="return confirm('Apakah anda ingin menghapus data ini?')" href="?pg=tambah-buku&delete=<?= $rowBook['id'] ?>" class="btn btn-sm btn-danger">Delete</a>
                                    </td>
                                </tr>
                            <?php endwhile ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>