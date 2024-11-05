import 'package:belajar_state/catatan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainApp();
}

class _MainApp extends State<MainApp> {
  TextEditingController judulCtrl = TextEditingController();
  TextEditingController isiCtrl = TextEditingController();
  List<Catatan> listCatatan = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'List Catatan',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              TextField(
                controller: judulCtrl,
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Judul Catatan"),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: isiCtrl,
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Isi Catatan"),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        judulCtrl.clear();
                        isiCtrl.clear();
                      },
                      child: const Text('clear')),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          listCatatan.add(Catatan(
                              judul: judulCtrl.text, isi: isiCtrl.text));
                          judulCtrl.clear();
                          isiCtrl.clear();
                        });
                      },
                      child: const Text('simpan'))
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
