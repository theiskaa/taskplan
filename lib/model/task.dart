
class Task {
  int id;
  String name;
  String description;

  Task({this.name, this.description});
  Task.withId({this.id, this.name, this.description});

  Task.fromObject(dynamic o) {
    this.id = o['id'];
    this.name = o['name'];
    this.description = o['description'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['description'] = description;

    return map;
  }
}