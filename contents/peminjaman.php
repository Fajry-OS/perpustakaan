<?php
// $queryUser = mysqli_query($koneksi, "SELECT * FROM user ORDER BY id DESC");
//deleted_at untuk soft delete
$queryPinjam = mysqli_query($koneksi, "SELECT anggota.nama_lengkap as nama_anggota, user.nama_lengkap, peminjaman.* FROM peminjaman LEFT JOIN anggota ON anggota.id = peminjaman.id_anggota LEFT JOIN user ON user.id = peminjaman.id_user WHERE peminjaman.deleted_at = 0 ORDER BY id DESC");

?>

<div class="container mt-5">
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header">Transaksi Peminjaman</div>
                <div class="card-body">
                    <div align="right" class="mb-3">
                        <a href="?pg=tambah-peminjaman" class="btn btn-primary">Tambah</a>
                    </div>
                    <?php if (isset($_GET['tambah'])) : ?>
                        <div class="alert alert-success">Data Berhasil Ditambah</div>
                    <?php endif ?>
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Kode Transaksi</th>
                                <th>Anggota</th>
                                <th>Tanggal Pinjam</th>
                                <th>Tanggal Kembali</th>
                                <th>Status</th>
                                <th>Petugas</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 1;
                            while ($rowPinjam = mysqli_fetch_assoc($queryPinjam)) : ?>
                                <tr>
                                    <td><?= $no++ ?></td>
                                    <td><?= $rowPinjam['kode_transaksi'] ?></td>
                                    <td><?= $rowPinjam['nama_anggota'] ?></td>
                                    <td><?= $rowPinjam['tgl_pinjam'] ?></td>
                                    <td><?= $rowPinjam['tgl_kembali'] ?></td>
                                    <td> <?= getStatus($rowPinjam['status']) ?></td>
                                    <td><?= $rowPinjam['nama_lengkap'] ?></td>
                                    <td>
                                        <a class="btn btn-sm btn-warning" href="?pg=tambah-peminjaman&detail=<?= $rowPinjam['id'] ?>">Detail</a>
                                        <a onclick="return confirm('Apakah anda ingin menghapus data ini?')" href="?pg=tambah-peminjaman&delete=<?= $rowPinjam['id'] ?>" class="btn btn-sm btn-danger">Delete</a>
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