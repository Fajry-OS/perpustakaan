<?php
$queryLevel = mysqli_query($koneksi, "SELECT * FROM level ORDER BY id DESC");

?>

<div class="container mt-5">
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header">Data Level</div>
                <div class="card-body">
                    <div align="right" class="mb-3">
                        <a href="?pg=tambah-level" class="btn btn-primary">Tambah</a>
                    </div>
                    <?php if (isset($_GET['tambah'])) : ?>
                        <div class="alert alert-success">Data Berhasil Ditambah</div>
                    <?php endif ?>
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama Level</th>
                                <th>Keterangan</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 1;
                            while ($rowLevel = mysqli_fetch_assoc($queryLevel)) : ?>
                                <tr>
                                    <td><?= $no++ ?></td>
                                    <td><?= $rowLevel['nama_level'] ?></td>
                                    <td><?= $rowLevel['keterangan'] ?></td>
                                    <td>
                                        <a class="btn btn-sm btn-success" href="?pg=tambah-level&edit=<?= $rowLevel['id'] ?>">Edit</a>
                                        <a onclick="return confirm('Apakah anda ingin menghapus data ini?')" href="?pg=tambah-level&delete=<?= $rowLevel['id'] ?>" class="btn btn-sm btn-danger">Delete</a>
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