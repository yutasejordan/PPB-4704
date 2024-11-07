class Komputer {
  String nama;
  String harga;

  Komputer({required this.nama, required this.harga});

  static List<Komputer> listKomputer = [
    Komputer(nama: 'Laptop', harga: '10000000'),
    Komputer(nama: 'Komputer', harga: '600000'),
    Komputer(nama: 'Keyboard', harga: '700000'),
  ];
}
