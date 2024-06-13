import 'package:flutter/material.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/screen/admin/home_screen.dart';

class DashboardAdmin extends StatefulWidget {
  final String username;

  const DashboardAdmin({Key? key, required this.username}) : super(key: key);

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  int _selectedIndex = 0;
  String _title = 'default';

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _title = 'default';

    _widgetOptions = [
      HomeScreen(),
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Private Cluster di Bandar Lampung',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Vaganza Village Sukarame, solusi untuk Anda yang ingin tinggal bersama keluarga dilingkungan yang lebih Privasi, ditunjang dengan Fasilitas Keamanan yang Baik, Kabar baiknya, Vaganza Village kini hadir di Bandar Lampung, tepatnya berada di Sukarame, dimana lokasi ini diapit oleh 2 Pintu Tol ITERA Kota Baru, dan Pintu Tol Lematang'
                    'Perumahan ini memiliki Pagar Keliling Arcon yang menjadi Pembatas antara Area Hunian Penghuni dengan Lingkungan luar, sehingga tidak ada akses masuk lain selain melalui Gerbang Utama, yang Kami sebut One Gate System.'
                    'Pada Area Gerbang Utama, Kami tunjang dengan Pos & Petugas Keamanan 24 Jam untuk menambah Kualitas Keamanan dan menjadi pembatas antora Penghuni dengan Pengunjung'
                    'Selain itu, Kami tempatkan juga CCTV dibeberapa titik dalam Perumahan untuk merekam/mengawasi aktifitas penghuni maupun pengunjung Perumahan.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Lebih banyak informasi...',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        toolbarHeight: 60,
        backgroundColor: Asset.colorPrimaryDark, // Adjusted to a darker shade
        centerTitle: true,
        title: _title == 'default'
            ? Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          'Hai, ',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Changed text color to white
                          ),
                        ),
                        Text(
                          widget.username.isNotEmpty
                              ? widget.username
                              : 'Nama',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Changed text color to white
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Jabatan',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.8), // Adjusted opacity
                      ),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Asset.colorAccent,
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('image/logo2.png'),
                  backgroundColor: Asset.colorPrimaryDark,
                ),
              ),
            ],
          ),
        )
            : Text(
          _title,
          maxLines: 1,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Changed text color to white
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Asset.colorPrimaryDark, // Adjusted unselected item color
          selectedItemColor: Asset.colorPrimary,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Image.asset(
              'image/logo2.png',
              width: 280,
              height: 280,
            ),
          ),
          Expanded(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'default';
          }
          break;
        case 1:
          {
            _title = 'Profile';
          }
          break;
      }
    });
  }
}
