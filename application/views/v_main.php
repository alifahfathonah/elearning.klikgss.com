<div class="row col-md-12">
  <div class="panel panel-info">
    <div class="panel-heading">Selamat datang di Aplikasi E-Learning SMP INSTITUT INDONESIA SEMARANG</div>
    <div class="panel-body">
      <div class="alert alert-info">Selamat datang <b><?php echo $this->session->userdata('admin_nama'); ?></b></div>
      <?php
      if (!empty($p_mapel)) {
        echo "<h3>Mata pelajaran yang Anda ikuti : </h3><ul>";
        foreach ($p_mapel as $p) {
          echo '<li>' . $p->nama . '</li>';
        }
        echo '</ul>';
      }
      ?>
    </div>
  </div>
</div>
</div>