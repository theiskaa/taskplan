import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/model/task.dart';

class DbHelper {
  Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), "taskdata.db");
    var taskDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return taskDb;
  }

  void createDb(Database db, int version) async {
    await db.execute(
      "Create table tasks(id integer primary key, name text, description text)",
    );
  }

  Future<List<Task>> getTasks() async {
    Database db = await this.db;
    var result = await db.query("tasks");
    return List.generate(
      result.length,
      (i) {
        return Task.fromObject(result[i]);
      },
    );
  }

  Future<void> insert(Task task) async {
    Database db = await this.db;
    var result = await db.insert("tasks", task.toMap());
    return result;
  }

  Future<void> delete(int id) async {
    Database db = await this.db;
    var result = await db.rawDelete("delete from tasks where id = $id");
    return result;
  }

  Future<void> update(Task task) async {
    Database db = await this.db;
    var result = await db.update(
      "tasks",
      task.toMap(),
      where: "id=?",
      whereArgs: [task.id],
    );
    return result;
  }
}