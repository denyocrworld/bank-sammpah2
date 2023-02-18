import 'dart:io';

abstract class Hewan {
  //properti atau params
  String? nama;
  int? berat;
  int? umur;

  Hewan({
    this.nama,
    this.berat,
    this.umur,
  });

  void makan(int banyak) {
    berat = berat! + banyak;
  }

  void pup(int banyak) {
    berat = berat! - banyak;
  }

  void timeskip(int banyak) {
    umur = umur! + banyak;
  }

  void tidur() {}
}

class Kucing extends Hewan {
  int? jumlahKaki;

  Kucing({
    this.jumlahKaki,
    String? namanya,
    int? beratnya,
    int? umurnya,
  }) : super(nama: namanya, berat: beratnya, umur: umurnya);

  void berjalan(){}
}

class Burung extends Hewan {
  int? jumlahKaki;

  Burung({
    this.jumlahKaki,
    String? namanya,
    int? beratnya,
    int? umurnya,
  }) : super(nama: namanya, berat: beratnya, umur: umurnya);

  void berjalan(){}
}

void main() {
  var burung1 = Burung(namanya : "Alfi", beratnya: 5, jumlahKaki: 2, umurnya: 10);
  print("-Saat bangun tidur-");
  print(
    "nama = ${burung1.nama}, berat = ${burung1.berat}, umur = ${burung1.umur}, jumlah kaki = ${burung1.jumlahKaki}"
    );
  burung1.makan(10);
  print("-Setelah  Sarapan-");
  print(
    "nama = ${burung1.nama}, berat = ${burung1.berat}, umur = ${burung1.umur}, jumlah kaki = ${burung1.jumlahKaki}"
    );
  burung1.makan(7);
  print("-Setelah  Makan Siang-");
  print(
    "nama = ${burung1.nama}, berat = ${burung1.berat}, umur = ${burung1.umur}, jumlah kaki = ${burung1.jumlahKaki}"
    );
  burung1.timeskip(2);
  print("-2 Tahun Kemudian-");
  print(
    "nama = ${burung1.nama}, berat = ${burung1.berat}, umur = ${burung1.umur}, jumlah kaki = ${burung1.jumlahKaki}"
    );
}
