import 'package:flutter/material.dart';
import 'package:uts/komputer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainApp();
}

class _MainApp extends State<MainApp> {
  TextEditingController namaCtrl = TextEditingController();
  TextEditingController Ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Komputer> listKomputer = Komputer.listKomputer;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Toko Komputer'), centerTitle: true),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: listKomputer.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(listKomputer[index].nama),
                              subtitle: Text(listKomputer[index].harga),
                              trailing: SizedBox(
                                width: 100,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder()),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text("Clear")),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Cetak Struk")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
