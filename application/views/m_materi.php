<?php
$uri4 = $this->uri->segment(4);
?>

<div class="row col-md-12">
  <div class="panel panel-info">
    <div class="panel-heading">Data Materi
      <div class="tombol-kanan">
        <!-- <a class="btn btn-success btn-sm" onclick="return m_soal_e(0);"><i class="glyphicon glyphicon-plus" style="margin-left: 0px; color: #fff"></i> &nbsp;&nbsp;Tambah Data</a> -->
        <?= $tambah ?>
      </div>
    </div>
    <div class="panel-body">

      <!-- accordion -->
      <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

        <?php
        echo form_dropdown("pilih_mapel", $p_mapel, $uri4, "id='pilih_mapel_for_materi' class='form-control col-md-12'")."<br><br>";

        if (!empty($data)) {
          $no = 1;
          foreach ($data as $d) {
            ?>
            <div class="panel panel-default">
              <div class="panel-heading" role="tab" id="headingOne">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<?php echo $no; ?>" aria-expanded="true" aria-controls="collapseOne">
                  #<?php echo $no." : ".substr($d->nama, 0, 100); ?>
                </a>

                <div class="btn-group tombol-kanan <?= $admin ?>">
                  <a class="btn btn-default btn-xs">Pembuat: <?php echo $d->nama_guru; ?></a>
                  <a class="btn btn-info btn-xs" onclick="return m_materi_e('<?php echo $d->id; ?>');"><i class="glyphicon glyphicon-pencil" style="margin-left: 0px; color: #fff"></i> &nbsp;&nbsp;Edit</a>
                  <a class="btn btn-warning btn-xs" onclick="return m_materi_h('<?php echo $d->id; ?>');"><i class="glyphicon glyphicon-remove" style="margin-left: 0px; color: #fff"></i> &nbsp;&nbsp;Hapus</a>
                </div>

                <div class="btn-group tombol-kanan <?= $siswa ?>">
                  <a class="btn btn-primary btn-xs" href="<?= base_url() ?>adm/m_materi/download/<?= $d->id; ?>"><i class="glyphicon glyphicon-download" style="margin-left: 0px; color: #fff"></i> &nbsp;&nbsp;Download</a>
                </div>

              </div>
              <div id="collapse<?php echo $no; ?>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                <div class="panel-body">

                  <?php
                  if ($d->file != "") {
                    ?>
                    <?php
                    $file =  base_url().'upload/materi/'. $d->file;
                    $x = explode('.', $d->file);
			              $ekstensi = strtolower(end($x));
                    $type = array('png', 'jpg', 'gif');
                    if (in_array($ekstensi, $type) === true) {
                     ?>
                    <img src="<?php echo base_url(); ?>upload/materi/<?php echo $d->file; ?>" class="thumbnail" style="width: 300px; height: 280px; display: inline; float: left">
                  <?php }else{ ?>
                    <p><?= $d->file ?></p>
                  <?php } ?>
                    <a href="<?php echo base_url(); ?>adm/m_materi/hapus_gambar/<?php echo $this->uri->segment(4); ?>/<?php echo $d->id; ?>" style="display: inline; margin-left: 20px" class="<?= $hapus_file ?>" onclick="return confirm('Anda yakin..?');">Hapus File</a>
                  <?php } ?>
                </div>
              </div>
            </div>

            <?php
            $no++;
          }
        } else {
          echo '<div class="alert alert-danger">Belum ada materi untuk mata pelajaran tersebut. Silakan pilih mata pelajaran..</div>';
        }
        ?>
      </div>
    </div>
  </div>
</div>
</div>


<!-- Modal -->
<div class="modal fade" id="m_soal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Input Materi</h4>
      </div>
      <div class="modal-body">
        <form method="post" action="" name="f_materi" id="f_materi" onsubmit="return m_materi_s();">
          <input type="hidden" name="id" id="id" value="0">
          <div id="konfirmasi"></div>
          <table class="table table-form">
            <tr>
              <td class="" colspan="2" style="width: 20%">Mapel</td>
              <td style="width: 80%">
                <?php echo form_dropdown('id_mapel', $p_mapel, '', 'class="form-control" id="id_mapel" required'); ?>
              </td>
            </tr>
            <tr>
              <td class="" colspan="2">Guru</td>
              <td>
                <?php echo form_dropdown('id_guru', $p_guru, '', 'class="form-control" id="id_guru" required'); ?>
              </td>
            </tr>
            <tr>
              <td class="" colspan="2" style="width: 20%">Nama Materi</td>
              <td style="width: 80%">
                <input type="text" name="nama" id="nama" class="form-control">
              </td>
            </tr>
            <tr>
              <td class="" colspan="2" style="width: 20%">File Materi</td>
              <td style="width: 80%">
                <input type="file" name="file_materi" id="file_materi" class="form-control">
              </td>
            </tr>
          </table>
        </div>
        <div class="modal-footer">
          <button class="btn btn-primary">Simpan</button>
          <button class="btn btn-default" data-dismiss="modal">Tutup</button>
        </div>
      </form>
    </div>
  </div>
</div>

<script type="text/javascript">
<?php
$xid_guru = "";
if ($sess_level == "guru" && $sess_konid != "") {
  $xid_guru = $sess_konid;
}
?>
var id_guru_ = "<?php echo $xid_guru; ?>";
var id_mapel_ = "<?php echo $this->uri->segment(4); ?>";
</script>
