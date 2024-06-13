import 'package:flutter/material.dart';
import 'package:project_if22a/config/asset.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Contact Us",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Asset.colorPrimaryDark,
      ),
      body: SingleChildScrollView(
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.phone, color: Asset.colorPrimaryDark),
                    title: Text('Phone'),
                    subtitle: Text('0877 4908 0490'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.email, color: Asset.colorPrimaryDark),
                    title: Text('Gmail'),
                    subtitle: Text('muibaroksms0318@gmail.com'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.location_pin, color: Asset.colorPrimaryDark),
                    title: Text('Kantor'),
                    subtitle: Text(
                      'Kompleks Perumahan Kayana Asri Residence Block B1, Jl Raya Pasar Kecapi RT.001 RW.013, Kelurahan Jatirahayu, Kecamatan Pondok Melati, Kodya Bekasi(17414)',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
