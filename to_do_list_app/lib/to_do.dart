class Todo {
  int? id;
  String nama;
  String deskripsi;
  bool done;

  Todo(this.nama, this.deskripsi, {this.done = false, this.id});

  static List<Todo> dummy = [
    Todo("Latihan 1", "latihan 1"),
    Todo("Latihan 2", "latihan 3", done: true),
    Todo("Latihan 3", "latihan 3"),
  ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "nama": nama,
      "deskripsi": deskripsi,
      "done": done
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      map['nama'] as String,
      map['deskripsi'] as String,
      done: map['done'] == 0 ? false : true,
      id: map['id'],
    );
  }
}
