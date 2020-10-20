import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PageCustomeGridview extends StatefulWidget {
  @override
  _PageCustomGridviewState createState() => _PageCustomGridviewState();
}

class _PageCustomGridviewState extends State<PageCustomeGridview> {
  List<Container> daftarRambuLalulintas = new List();
  var itemRambu = [
    {
      "nama": "Tikungan ke kiri",
      "images": "tikungan-ke-kiri.png",
      "keterangan":
          "Menandakan di depan akan ada tikungan atau belokan ke kiri arah jarum jam 10.30"
    },
    {
      "nama": "Tikungan ke kanan",
      "images": "tikungan-ke-kanan.png",
      "keterangan":
          "Menandakan di depan akan ada tikungan atau belokan ke kanan arah jarum jam 13.30"
    },
    {
      "nama": "Tikungan tajam ke kiri",
      "images": "tikungan-tajam-ke-kir.png",
      "keterangan":
          "Menandakan di depan akan ada tikungan tajam ke arah kiri arah jarum jam 09.00"
    },
    {
      "nama": "Tikungan tajam ke kanan",
      "images": "tikungan-tajam-ke-kanan.png",
      "keterangan":
          "Menandakan di depan akan ada tikungan tajam ke arah kanan arah jarum jam 15.00"
    },
    {
      "nama": "Tikungan tajam ganda, tikungan pertama ke kiri",
      "images": "tikungan-tajam-ganda-ke-kiri-pertama.png",
      "keterangan":
          "Menandakan di depan akan ada dua tikungan, dimana tikungan pertamanya ke arah kiri."
    },
    {
      "nama": "Tikungan tajam ganda, tikungan pertama ke kanan",
      "images": "Tikungan-tajam-ganda-tikungan-pertama-ke-kanan.png",
      "keterangan":
          "Menandakan di depan akan ada dua tikungan. Dimana tikungan pertamannya ke arah kanan"
    },
    {
      "nama": "Urutan beberapa tikungan, tikungan pertama ke kiri",
      "images": "Urutan-beberapa-tikungan-tikungan-pertama-ke-kiri.png",
      "keterangan":
          "Mendakan di depan akan ada banyak tikungan, tikungan pertama ke arah kiri"
    },
    {
      "nama": "Urutan beberapa tikungan, tikungan pertama ke kanan",
      "images": "Urutan-beberapa-tikungan-tikungan-pertama-ke-kanan.png",
      "keterangan":
          "sama dengan penjelasan di atas hanya saja yang berbeda tingkungan pertama ke arah kanan"
    },
    {
      "nama": "Pengarah putaran ke kanan",
      "images": "Pengarah-putaran-ke-kanan.png",
      "keterangan": "Menunjukan putaran ke arah kanan"
    },
    {
      "nama": "Pengarah putaran ke kiri",
      "images": "Pengarah-putaran-ke-kanan.png",
      "keterangan": "Menunjukan putaran ke arah kiri"
    },
  ];

//method
  _buatDataListmakanan() async {
    for (var i = 0; i < itemRambu.length; i++) {
      final dataMakanan = itemRambu[i];

      final String gambarMakanan = dataMakanan['images'];
      daftarRambuLalulintas.add(new Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: InkWell(
            onTap: () {
              // Navigator.pop(context);
              Alert(
                context: context,
                type: AlertType.warning,
                title: "KETERANGAN RAMBU",
                desc: dataMakanan['keterangan'],
              ).show();
            },
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                ),
                Hero(

                    //Animasi untuk gambar
                    tag: dataMakanan['nama'],
                    child: Image.asset(
                      "images/$gambarMakanan",
                      height: 120.0,
                      width: 120,
                      fit: BoxFit.cover,
                    )),
                Padding(padding: EdgeInsets.all(100)),
                Text(
                  dataMakanan["nama"],
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ));
    }
  }

//Proses backgroud
//proses ini akan berjalan dalam mode bacground
  @override
  void initState() {
    super.initState();
    _buatDataListmakanan();
  }

//proses menampilkan data
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Apps List Rambu"),
        backgroundColor: Colors.deepOrange,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: daftarRambuLalulintas,
      ),
    );
  }
}
