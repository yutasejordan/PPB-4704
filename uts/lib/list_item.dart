import 'package:flutter/material.dart';
import 'package:uts/komputer.dart';

class ListItem extends StatelessWidget {
  final Komputer komputer;
  const ListItem({super.key, required this.komputer});

  @override
  Widget build(BuildContext context) {
    List<Komputer> listKomputer = Komputer.listKomputer;
    return SafeArea(
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
            Expanded(
                child: ListView.builder(
                    itemCount: listKomputer.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(listKomputer[index].nama),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
