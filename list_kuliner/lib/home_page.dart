import 'package:flutter/material.dart';
import 'package:list_kuliner/list_item.dart';
import 'package:list_kuliner/makanan.dart';
import 'package:list_kuliner/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Makanan> listMenu = Makanan.listMakanan;

    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.list_alt, size: 30),
              Text(
                "List Kuliner",
                style: textHeader2,
              )
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
                  itemCount: listMenu.length,
                  itemBuilder: (context, index) {
                    return ListItem(makanan: listMenu[index]);
                  }))
        ],
      ),
    );
  }
}
