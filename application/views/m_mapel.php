<div class="row col-md-12">
  <div class="panel panel-info">
    <div class="panel-heading">Data Mata Pelajaran
      <div class="tombol-kanan">
        <a class="btn btn-success btn-sm tombol-kanan" href="#" onclick="return m_mapel_e(0);"><i class="glyphicon glyphicon-plus"></i> &nbsp;&nbsp;Tambah</a>
      </div>
    </div>
    <div class="panel-body">


      <table class="table table-bordered">
        <thead>
          <tr>
            <th width="5%">No</th>
            <th width="75%">Nama</th>
            <th width="20%">Aksi</th>
          </tr>
        </thead>

        <tbody>
          <?php
          if (!empty($data)) {
            $no = 1;
            foreach ($data as $d) {
              echo '<tr>
                      <td class="ctr">' . $no . '</td>
                      <td>' . $d->nama . '</td>
                      <td class="ctr">
                        <div class="btn-group">
                          <a href="#" onclick="return m_mapel_e(' . $d->id . ');" class="btn btn-info btn-xs"><i class="glyphicon glyphicon-pencil" style="margin-left: 0px; color: #fff"></i> &nbsp;&nbsp;Edit</a>
                          <a href="#" onclick="return m_mapel_h(' . $d->id . ');" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove" style="margin-left: 0px; color: #fff"></i> &nbsp;&nbsp;Hapus</a>';
              echo '</div>
                      </td>
                      </tr>
                      ';
              $no++;
            }
          } else {
            echo '<tr><td colspan="3">Belum ada data</td></tr>';
          }
          ?>
        </tbody>
      </table>

    </div>
  </div>
</div>
</div>





<div class="modal fade" id="m_mapel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 id="myModalLabel">Data Mata Pelajaran</h4>
      </div>
      <div class="modal-body">
        <form name="f_mapel" id="f_mapel" onsubmit="return m_mapel_s();">
          <input type="hidden" name="id" id="id" value="0">
          <table class="table table-form">
            <tr>
              <td style="width: 25%">Nama</td>
              <td><input type="text" class="form-control" name="nama" id="nama" required></td>
              <td id="kelas_">
                <select name="kelas" id="kelas" type="text" class="form-control" required>
                  <option value=" ">--Pilih Kelas--</option>
                  <option value="(X AKL 1)">X AKL 1</option>
                  <option value="(X AKL 2)">X AKL 2</option>
                  <option value="(X OTKP 1)">X OTKP 1</option>
                  <option value="(X OTKP 2)">X OTKP 2</option>
                  <option value="(X BDP 1)">X BDP 1</option>
                  <option value="(X BDP 2)">X BDP 2</option>
                  <option value="(X TKJ 1)">X TKJ 1</option>
                  <option value="(X TKJ 2)">X TKJ 2</option>

                  <option value="(XI AKL 1)">XI AKL 1</option>
                  <option value="(XI AKL 2)">XI AKL 2</option>
                  <option value="(XI OTKP 1)">XI OTKP 1</option>
                  <option value="(XI OTKP 2)">XI OTKP 2</option>
                  <option value="(XI BDP 1)">XI BDP 1</option>
                  <option value="(XI BDP 2)">XI BDP 2</option>
                  <option value="(XI TKJ 1)">XI TKJ 1</option>
                  <option value="(XI TKJ 2)">XI TKJ 2</option>

                  <option value="(XII AKL 1)">XII AKL 1</option>
                  <option value="(XII AKL 2)">XII AKL 2</option>
                  <option value="(XII OTKP 1)">XII OTKP 1</option>
                  <option value="(XII OTKP 2)">XII OTKP 2</option>
                  <option value="(XII BDP 1)">XII BDP 1</option>
                  <option value="(XII BDP 2)">XII BDP 2</option>
                  <option value="(XII TKJ 1)">XII TKJ 1</option>
                  <option value="(XII TKJ 2)">XII TKJ 2</option>
                </select>
              </td>
            </tr>
          </table>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary">Simpan</button>
        <button class="btn" data-dismiss="modal" aria-hidden="true">Tutup</button>
      </div>
      </form>
    </div>
  </div>
</div>