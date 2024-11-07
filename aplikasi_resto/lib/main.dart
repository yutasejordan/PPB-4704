import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final profilResto = <String, String>{};

  MainApp({super.key}) {
    profilResto["name"] = "Atas Kota Coffe & Space";
    profilResto["desc"] =
        "Dear Our Lovely Customer, Please don't bring outside food and drinks. only items purchased at Atas Kota Coffe & Space may be consumed.";
    profilResto["img"] = "askot.jpg";
    profilResto["addr"] =
        "Gg. Kedawung V, Patemon, Kec. Gn. Pati, Kota Semarang, Jawa Tengah 50228";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Restoran",
      home: Scaffold(
        backgroundColor: Color.fromRGBO(89, 96, 102, 1),
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.4),
            title: Center(
              child: Text(
                profilResto["name"] ?? "",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            )),
        body: SingleChildScrollView(
          padding:
              const EdgeInsets.only(right: 10, left: 10, top: 20, bottom: 20),
          child: Column(
            children: [
              Image(image: AssetImage("assets/${profilResto["img"] ?? ""}")),
              SizedBox(height: 15),
              Row(
                children: [
                  btn(Icons.email_outlined,
                      "mailto:yutasej@gmail.com?subject=Tanya Seputar Resto"),
                  SizedBox(width: 7),
                  btn(Icons.phone_android_outlined, "tel:081215987726"),
                  SizedBox(width: 7),
                  mapBtn()
                ],
              ),
              SizedBox(height: 10),
              subTitle("Deskripsi:"),
              SizedBox(height: 7),
              parag(profilResto["desc"] ?? ""),
              SizedBox(height: 7),
              subTitle("List Menu:"),
              SizedBox(height: 7),
              listMenu("Alpenlible", "Milky strawberry, vanilla, and mint"),
              listMenu("Frosty Matcha", "Matcha, mint, milky, and creamy"),
              listMenu("Nutty Monkey", "Milky banana, choco and nutty"),
              SizedBox(height: 7),
              subTitle("Alamat:"),
              SizedBox(height: 7),
              parag(profilResto["addr"] ?? ""),
              SizedBox(height: 7),
              subTitle("Jam Buka:"),
              SizedBox(height: 7),
              openHours("Senin", "10.00-00.00"),
              openHours("Selasa", "10.00-00.00"),
              openHours("Rabu", "10.00-00.00"),
              openHours("Kamis", "10.00-00.00"),
              openHours("Jum'at", "10.00-00.00"),
              openHours("Sabtu", "10.00-00.00"),
              openHours("Minggu", "10.00-00.00"),
            ],
          ),
        ),
      ),
    );
  }

  Row openHours(String day, String hour) {
    return Row(
      children: [
        Icon(
          Icons.circle_outlined,
          color: Colors.white,
          size: 14,
        ),
        SizedBox(width: 5),
        Container(
          width: 100,
          child: Text(
            day,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white),
          ),
        ),
        Text(hour,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white))
      ],
    );
  }

  Text parag(String paragraf) {
    return Text(paragraf,
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white));
  }

  Text subTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.w900, fontSize: 25, color: Colors.white),
    );
  }

  Row listMenu(String menu, String desc) {
    return Row(
      children: [
        Icon(
          Icons.circle_outlined,
          color: Colors.white,
          size: 14,
        ),
        SizedBox(width: 5),
        Text(
          "$menu",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
        ),
        SizedBox(width: 5),
        Text(
          "($desc)",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
        )
      ],
    );
  }

  Expanded btn(IconData icon, String uri) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          launcher(uri);
        },
        child: Icon(icon),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }

  void launcher(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception("tidak dapat memanggil: $uri");
    }
  }

  Expanded mapBtn() {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          openMap(-6.9824877063076976, 110.40902840896867);
        },
        child: Icon(Icons.map_outlined),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }

  void openMap(double lat, long) async {
    String googleMapUrl =
        "https://www.google.com/maps/search/?api=1&query=$lat,$long";

    if (!await canLaunchUrl(Uri.parse(googleMapUrl))) {
      await launchUrl(Uri.parse(googleMapUrl));
    } else {
      throw "tidak dapat memanggil: $googleMapUrl";
    }
  }
}
