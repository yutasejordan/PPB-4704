import 'package:intl/intl.dart';

const umr = 3000000;
var numFormat = NumberFormat("#,000");
var dateFormat = DateFormat("yyyy-MM-dd");

abstract class Karyawan {
  String npp = "";
  String nama = "";
  String? alamat;
  int tahunMasuk;
  int _gaji = umr;

  Karyawan(this.npp, this.nama, {this.tahunMasuk = 2015});

  void presensi(DateTime jamMasuk);

  String deskripsi() {
    String teks = '''=========================================================
NPP     : $npp
Nama    : $nama
Gaji    : ${numFormat.format(gaji)}''';

    if (alamat != null) {
      teks += "\nAlamat  : $alamat";
    }

    return teks;
  }

  int get tunjangan;

  int get gaji => _gaji + tunjangan;

  set gaji(int gaji) {
    if (gaji < umr) {
      _gaji = umr;
      print(
          "========================================================= \nGaji Karyawan Atas Nama $nama Tidak Boleh Dibawah UMR");
    } else {
      _gaji = gaji;
    }
  }
}

class StaffBiasa extends Karyawan {
  StaffBiasa(super.npp, super.nama, {tahunMasuk = 2015});

  @override
  void presensi(DateTime jamMasuk) {
    if (jamMasuk.hour > 8) {
      print("$nama pada ${dateFormat.format(jamMasuk)} datang terlambat");
    } else {
      print("$nama pada ${dateFormat.format(jamMasuk)} datang tepat waktu");
    }
  }

  @override
  int get tunjangan => ((2023 - tahunMasuk) < 5) ? 500000 : 1000000;
}

enum tipeJabatan { Kabag, Manajer, Direktur }

class Pejabat extends Karyawan {
  tipeJabatan jabatan;

  Pejabat(super.npp, super.nama, this.jabatan);

  @override
  void presensi(DateTime jamMasuk) {
    if (jamMasuk.hour > 10) {
      print("$nama pada ${dateFormat.format(jamMasuk)} datang terlambat");
    } else {
      print("$nama pada ${dateFormat.format(jamMasuk)} datang tepat waktu");
    }
  }

  @override
  int get tunjangan {
    if (jabatan == tipeJabatan.Kabag) {
      return 1500000;
    } else if (jabatan == tipeJabatan.Manajer) {
      return 2000000;
    } else {
      return 3000000;
    }
  }

  @override
  String deskripsi() {
    String teks = super.deskripsi();
    teks += "\nJabatan : ${jabatan.name}";

    return teks;
  }
}
