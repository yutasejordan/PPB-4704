import 'package:flutter/material.dart';
import 'package:to_do_list_app/database_helper.dart';
import 'package:to_do_list_app/to_do.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ToDoList(),
    );
  }
}

class ToDoList extends StatefulWidget {
  const ToDoList({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ToDoList();
}

class _ToDoList extends State<ToDoList> {
  final TextEditingController _namaCtrl = TextEditingController();
  final TextEditingController _deskripsiCtrl = TextEditingController();
  final TextEditingController _searchCtrl = TextEditingController();
  List<Todo> toDoList = [];
  final dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    refreshList();
  }

  void cariTodo() async {
    String teks = _searchCtrl.text.trim();
    List<Todo> todos = [];
    if (teks.isEmpty) {
      todos = await dbHelper.getAllTodos();
    } else {
      todos = await dbHelper.searhTodo(teks);
    }

    setState(() {
      toDoList = todos;
    });
  }

  void refreshList() async {
    final todos = await dbHelper.getAllTodos();
    setState(() {
      toDoList = todos;
    });
  }

  void updateItem(int index, bool done) async {
    toDoList[index].done = done;
    await dbHelper.updateTodo(toDoList[index]);
    refreshList();
  }

  void deleteItem(int id) async {
    await dbHelper.deleteTodo(id);
    refreshList();
  }

  void addItem() async {
    await dbHelper.addTodo(Todo(_namaCtrl.text, _deskripsiCtrl.text));

    refreshList();

    _namaCtrl.text = "";
    _deskripsiCtrl.text = "";
  }

  void showForm() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              insetPadding: const EdgeInsets.all(20),
              title: const Text("Tambah"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("tutup")),
                ElevatedButton(
                    onPressed: () {
                      addItem();
                      Navigator.pop(context);
                    },
                    child: const Text("tambah"))
              ],
              content: SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    TextField(
                        controller: _namaCtrl,
                        decoration:
                            const InputDecoration(hintText: "Nama Kegiatan")),
                    TextField(
                        controller: _deskripsiCtrl,
                        decoration: const InputDecoration(
                            hintText: "Deskripsi Kegiatan"))
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Aplikasi To Do List "),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showForm();
            },
            child: const Icon(Icons.add_box_rounded)),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: _searchCtrl,
                onChanged: (_) {
                  cariTodo();
                },
                decoration: const InputDecoration(
                  hintText: "Pencarian",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: toDoList[index].done
                      ? IconButton(
                          icon: const Icon(Icons.check_circle),
                          onPressed: () {
                            updateItem(index, !toDoList[index].done);
                          },
                        )
                      : IconButton(
                          icon: const Icon(Icons.radio_button_unchecked),
                          onPressed: () {
                            updateItem(index, !toDoList[index].done);
                          },
                        ),
                  title: Text(toDoList[index].nama),
                  subtitle: Text(toDoList[index].deskripsi),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      deleteItem(toDoList[index].id ?? 0);
                    },
                  ),
                );
              },
              itemCount: toDoList.length,
            )),
          ],
        ));
  }
}
