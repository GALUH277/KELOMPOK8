import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsPage extends StatelessWidget {
  // Koordinat yang ingin ditampilkan di Google Maps
  // final String latitude = '-6.2737773';
  // final String longitude = '106.7726071';

  void launchGoogleMaps() async {
    // Buat URL dengan koordinat yang sudah ditentukan
    final String googleMapsUrl = 'https://maps.app.goo.gl/j74ELFGK6zwXArML7?g_st=iw';

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: launchGoogleMaps,
          child: Text('Buka Google Maps'),
        ),
      ),
    );
  }
}
