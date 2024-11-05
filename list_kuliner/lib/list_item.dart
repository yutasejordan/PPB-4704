import 'package:flutter/material.dart';
import 'package:list_kuliner/detail_page.dart';
import 'package:list_kuliner/makanan.dart';
import 'package:list_kuliner/styles.dart';

class ListItem extends StatelessWidget {
  final Makanan makanan;

  const ListItem({super.key, required this.makanan});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(makanan: makanan)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 178, 178, 178),
                  offset: Offset(1.0, 2.0),
                  blurRadius: 6.0)
            ]),
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                makanan.gambarUtama,
                width: 85,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(makanan.nama,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(makanan.deskripsi,
                      style: const TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 15)),
                  Text(makanan.harga,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 15)),
                ],
              ),
            ),
            const Icon(Icons.food_bank_rounded, color: iconColor)
          ],
        ),
      ),
    );
  }
}
