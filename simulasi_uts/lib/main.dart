import 'package:flutter/material.dart';
import 'package:simulasi_uts/catatan.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController judulCtrl = TextEditingController();
  TextEditingController isiCtrl = TextEditingController();
  List<Catatan> listCatatan = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Catatan Pagi"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              TextField(
                  controller: judulCtrl,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Judul Catatan")),
              const SizedBox(height: 10),
              TextField(
                  controller: isiCtrl,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Isi Catatan")),
              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        judulCtrl.clear();
                        isiCtrl.clear();
                      },
                      child: const Text("Clear")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          listCatatan.add(Catatan(
                            judul: judulCtrl.text,
                            isi: isiCtrl.text,
                          ));
                          judulCtrl.clear();
                          isiCtrl.clear();
                        });
                      },
                      child: const Text("Submit")),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                  child: ListView.builder(
                      itemCount: listCatatan.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.event_note_rounded),
                          title: Text(listCatatan[index].judul),
                          subtitle: Text(listCatatan[index].isi),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
