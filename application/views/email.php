<div class="row col-md-12">
	<div class="panel panel-info">
		<div class="panel-heading">Email Setting
		</div>
		<div class="panel-body">
			<form action="<?= base_url() ?>adm/email/simpan" method="post">
				<input type="hidden" name="id" id="id" value="1">
				<?php $a = $this->db->query("SELECT * FROM m_admin WHERE id = 1")->row(); ?>
				<table class="table table-form">
					<tr>
						<td style="width: 25%">Email</td>
						<td style="width: 75%"><input type="text" class="form-control" value="<?= $a->email ?>" name="email" id="email" required></td>
					</tr>
					<tr>
						<td style="width: 25%">Password</td>
						<td style="width: 75%"><input type="password" class="form-control" value="<?= $a->pass ?>" name="password" id="password" required></td>
					</tr>
					<tr>
						<td colspan="2">Catatan:
							<br> Gunakan email yang menggunakan gmail
							<br> Pastikan email dan password benar (jika email atau password tidak sesuai, program tidak bisa jalan.)
							<br> Pastikan fitur "Akses aplikasi yang kurang aman" di akun google anda aktif
							<br> Pastikan fitur 'verifikasi 2 langkah' di akun gmail anda tidak aktif
							<br> Pastikan fitur 'Gunakan ponsel untuk masuk' di akun gmail anda tidak aktif
						</td>
					</tr>
				</table>
				<button class="btn btn-primary">Simpan</button>
			</form>
		</div>
	</div>
</div>
