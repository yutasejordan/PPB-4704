import 'karyawan.dart';

void main(List<String> arguments) {
  List<Karyawan> dataKaryawan = genData(dummyData());

  dataKaryawan[0].presensi(DateTime.parse("2024-09-25 10:00:00"));
  dataKaryawan[1].presensi(DateTime.parse("2024-09-25 07:00:00"));
  dataKaryawan[2].presensi(DateTime.parse("2024-09-25 10:00:00"));

  dataKaryawan[0].gaji = 4000000;
  dataKaryawan[1].gaji = 3000000;
  dataKaryawan[2].gaji = 2000000;

  dataKaryawan[0].alamat = "Semarang";
  dataKaryawan[1].alamat = "Surabaya";

  for (var staff in dataKaryawan) {
    print(staff.deskripsi());
  }
}

List<Karyawan> genData(var listData) {
  List<Karyawan> data = [];

  for (var dtPegawai in listData) {
    Karyawan pegawai;
    if (dtPegawai.containsKey('jabatan')) {
      pegawai =
          Pejabat(dtPegawai['npp'], dtPegawai['nama'], dtPegawai['jabatan']);
    } else {
      pegawai = StaffBiasa(dtPegawai['npp'], dtPegawai['nama']);
    }

    if (dtPegawai.containsKey('thn_masuk')) {
      pegawai.tahunMasuk = dtPegawai['thn_masuk'];
    }

    if (dtPegawai.containsKey('alamat')) {
      pegawai.alamat = dtPegawai['alamat'];
    }

    data.add(pegawai);
  }

  return data;
}

List<Map<String, dynamic>> dummyData() {
  List<Map<String, dynamic>> data = [
    {
      "npp": "A123",
      "nama": "Lars Bak",
      "thn_masuk": 2017,
      "jabatan": tipeJabatan.Direktur,
      "alamat": "Semarang Indonesia"
    },
    {
      "npp": "A345",
      "nama": "Kasper Lund",
      "thn_masuk": 2018,
      "jabatan": tipeJabatan.Manajer,
      "alamat": "Semarang Indonesia"
    },
    {"npp": "B231", "nama": "Guido Van Rossum", "alamat": "California Amerika"},
    {
      "npp": "B355",
      "nama": "Rasmus Lerdorf",
      "thn_masuk": 2015,
      "alamat": "Bandung Indonesia"
    },
    {
      "npp": "B355",
      "nama": "Dennis MacAlistair Ritchie",
      "jabatan": tipeJabatan.Kabag,
      "alamat": "Semarang Indonesia"
    }
  ];
  return data;
}
