import 'package:belajar_uts/list_menu.dart';
import 'package:belajar_uts/makanan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    List<Makanan> listMenu = Makanan.listMakanan;

    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color.fromRGBO(142, 138, 138, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        title: const Text(
          'Belajar UTS',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.list_alt_outlined,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                SizedBox(width: 10),
                Text(
                  'List Kuliner',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
              itemCount: listMenu.length,
              itemBuilder: (context, index) {
                return ListItem(makanan: listMenu[index]);
              },
            ))
          ],
        ),
      )),
    ));
  }
}
