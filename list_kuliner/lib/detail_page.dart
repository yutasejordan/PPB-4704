import 'package:flutter/material.dart';
import 'package:list_kuliner/makanan.dart';
import 'package:list_kuliner/styles.dart';

class DetailPage extends StatelessWidget {
  final Makanan makanan;
  const DetailPage({super.key, required this.makanan});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: pageBgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Image.asset(makanan.gambarUtama, scale: 0.5),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ButtonBack(), ButtonLike()],
                  ),
                )
              ]),
              Container(
                color: headerBackColor,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(makanan.nama, style: textHeader1),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.timelapse_outlined,
                            color: Colors.blueAccent),
                        Text(makanan.waktuBuka)
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.local_fire_department,
                            color: Colors.red),
                        Text(makanan.waktuBuka)
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.attach_money,
                          color: Colors.green,
                        ),
                        Text(makanan.harga)
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 30, left: 30, bottom: 15),
                child: Text(
                  makanan.detail,
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: makanan.gambarLain.map((img) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(img),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: const Text(
                  "Bahan Racikan",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
                height: 100,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Image.asset(makanan.bahan[index].values.first,
                                  width: 52),
                              Text(makanan.bahan[index].keys.first),
                            ],
                          ),
                        ),
                    separatorBuilder: (_, index) => const SizedBox(
                          width: 15,
                        ),
                    itemCount: makanan.bahan.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
    );
  }
}

class ButtonLike extends StatefulWidget {
  const ButtonLike({super.key});

  @override
  State<StatefulWidget> createState() => _ButtonLike();
}

class _ButtonLike extends State<ButtonLike> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      child: IconButton(
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
            color: Colors.red,
          )),
    );
  }
}
