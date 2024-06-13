import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/screen/admin/list_harga.dart';
import 'package:project_if22a/screen/admin/maps.dart';
import 'package:project_if22a/screen/admin/contact_us_page.dart';
import 'package:project_if22a/screen/admin/type_rumah.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _fragments = [
    {'title': 'Type Rumah', 'view': TypeRumahPage()},
    {'title': 'List Harga', 'view': ListHargaPage()},
    {'title': 'Maps', 'view': MapsPage()},
    {'title': 'Contact Us', 'view': ContactUsPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [

          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Type Rumah",
              style: TextStyle(
                color: Asset.colorPrimaryDark,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 5),
          SizedBox(
            height: 200,
            child: CarouselSlider(
              items: [
                BeritaTerkini('image/saphire.jpg', 'Cluster Saphire', '22/11/2023'),
                BeritaTerkini('image/tulip.jpg', 'Cluster Tulip', '20/10/2023'),
                BeritaTerkini('image/VF.jpg', 'Gate', '17/04/2024'),
                BeritaTerkini('image/VG.jpg', 'Gate 2', '03/04/2024'),
                BeritaTerkini('image/lily.jpg', 'Cluster Lily', '12/02/2024'),
                BeritaTerkini('image/BN.jpg', 'Vaganza Village', '12/02/2024'),
                BeritaTerkini('image/alamanda.jpg', 'Cluster Alamanda', '12/02/2024'),
                BeritaTerkini('image/50.jpg', 'Vaganza Village', '12/02/2024'),
                BeritaTerkini('image/38.jpg', 'Vaganza Village', '12/02/2024'),
              ],
              options: CarouselOptions(
                height: 220.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ),
          SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomIconButton('Type Rumah', Icons.house, 0, _navigateToPage),
                // CustomIconButton('List Harga', Icons.attach_money_sharp, 1, _navigateToPage),
                CustomIconButton('Maps', Icons.location_on_outlined, 2, _navigateToPage),
                CustomIconButton('Contact Us', Icons.call, 3, _navigateToPage),
              ],
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  void _navigateToPage(int index) {
    if (index == 2) {
      // If this is the 'Maps' icon
      MapsPage().launchGoogleMaps(); // Call the launchGoogleMaps function from MapsPage
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => _fragments[index]['view'],
        ),
      );
    }
  }
}

class CustomIconButton extends StatelessWidget {
  final String nameLabel;
  final IconData iconLabel;
  final int index;
  final Function(int) onPressed;

  CustomIconButton(this.nameLabel, this.iconLabel, this.index, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Material(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
                onTap: () => onPressed(index),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Asset.colorPrimaryDark,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      iconLabel,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              nameLabel,
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}

class BeritaTerkini extends StatelessWidget {
  final String img;
  final String judul;
  final String tanggal;

  BeritaTerkini(this.img, this.judul, this.tanggal);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black54],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    judul,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    tanggal,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
