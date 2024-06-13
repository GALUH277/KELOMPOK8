import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_if22a/config/asset.dart'; // Import your Asset class

class TypeRumahPage extends StatelessWidget {
  final List<Map<String, dynamic>> daftarRumah = [
    {
      'img': 'image/saphire.jpg',
      'judul': 'Cluster Saphire',
      'tanggal': '22/11/2023',
      'harga': 1500000000,
      'deskripsi': 'Rumah mewah dengan 3 ruangan tidur, 2 lantai, tanah 150 m², garasi 1 mobil',
    },
    {
      'img': 'image/tulip.jpg',
      'judul': 'Cluster Tulip',
      'tanggal': '20/10/2023',
      'harga': 1800000000,
      'deskripsi': 'Hunian nyaman dengan 4 ruangan tidur, 1 lantai, tanah 200 m², garasi 2 mobil',
    },
    {
      'img': 'image/lily.jpg',
      'judul': 'Cluster Lily',
      'tanggal': '12/02/2024',
      'harga': 1600000000,
      'deskripsi': 'Rumah bergaya kontemporer dengan 2 ruangan tidur, 3 lantai, tanah 180 m², garasi 1 mobil',
    },
    {
      'img': 'image/BN.jpg',
      'judul': 'Vaganza Village',
      'tanggal': '12/02/2024',
      'harga': 1900000000,
      'deskripsi': 'Perumahan terintegrasi dengan 3 ruangan tidur, 2 lantai, tanah 220 m², garasi 2 mobil',
    },
    {
      'img': 'image/alamanda.jpg',
      'judul': 'Cluster Alamanda',
      'tanggal': '12/02/2024',
      'harga': 1700000000,
      'deskripsi': 'Rumah minimalis dengan 2 ruangan tidur, 1 lantai, tanah 120 m², garasi tidak ada',
    },
    {
      'img': 'image/50.jpg',
      'judul': 'Vaganza Village',
      'tanggal': '12/02/2024',
      'harga': 1400000000,
      'deskripsi': 'Kawasan hunian eksklusif dengan 4 ruangan tidur, 2 lantai, tanah 250 m², garasi 3 mobil',
    },
    {
      'img': 'image/38.jpg',
      'judul': 'Vaganza Village',
      'tanggal': '12/02/2024',
      'harga': 1300000000,
      'deskripsi': 'Rumah modern dengan 3 ruangan tidur, 1 lantai, tanah 180 m², garasi 2 mobil',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Type Rumah', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Asset.colorPrimaryDark, // Set app bar background color
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Image.asset(
                'image/logo2.png',
                // fit: BoxFit.cover, // Uncomment if needed
              ),
            ),
            CarouselSlider(
              items: daftarRumah.map((rumah) {
                return Builder(
                  builder: (BuildContext context) {
                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            rumah['img'],
                            fit: BoxFit.cover,
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  rumah['judul'],
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black, // Set title color
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Harga: Rp ${rumah['harga'].toString()}',
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent, // Set price color
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Tanggal: ${rumah['tanggal']}',
                                  style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.grey[500], // Set date color
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  rumah['deskripsi'],
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 500.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
