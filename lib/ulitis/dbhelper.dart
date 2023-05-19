import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Dbhepler {
  static Dbhepler dbhepler = Dbhepler._();

  Dbhepler._();

  Database? database;

  checkDB() async {
    if (database != null) {
      return database;
    } else {
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "RNW.DB");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE incomeexpense(id INTEGER PRIMARY KEY  AUTOINCREMENT,category TEXT,amount TEXT,status INTEGER,notes TEXT,paytypes TEXT,date TEXT,time TEXT)";
        db.execute(query);
      },
    );
  }

  insertData(
      {required category,
      required amount,
      required notes,
      required status,
      required paytypes,
      required date,
      required time}) async {
    database = await checkDB();
    database!.insert("incomeexpense",{
      "category": category,
      "amount": amount,
      "notes": notes,
      "paytypes": paytypes,
      "date": date,
      "time": time,
      "status": status,
    });
  }

  readData() async {
    database = await checkDB();
    String query = "SELECT*FROM incomeexpense ";
    List<Map> list = await database!.rawQuery(query);
    return list;
  }

  Filterdata({required statuscode}) async {
    database = await checkDB();
    String query = "SELECT * FROM incomeexpense WHERE status=$statuscode";
    List<Map> l1 = await database!.rawQuery(query);
    return l1;
  }

  deletedata({required id}) async {
    database = await checkDB();
    database!.delete("incomeexpense", where: "id=?", whereArgs: [id]);
  }

  upadtedata({required id,required category,required amount,required notes,required paytypes,required date,required time,required status }) async {
    database = await checkDB();
    database!.update("incomeexpense",{
    "category": category,
    "amount": amount,
    "notes": notes,
    "paytypes": paytypes,
    "date": date,
    "time": time,
    "status": status,
    },
    where: "id=?",whereArgs: [id]);
  }
  Future<List<Map>> ascendingfilter()
  async {
    database= await checkDB();
    String query = 'SELECT*FROM incomeexpense ORDER BY id';
    List<Map> list =await database!.rawQuery(query);
    return list;
  }
  Future<List<Map>> descfilter()
  async {
    database= await checkDB();
    String query = 'SELECT*FROM incomeexpense ORDER BY id DESC';
    List<Map> list =await database!.rawQuery(query);
    return list;
  }

  //TODO total income
  Future<List<Map>> totalIncome()
  async {
    database = await checkDB();
    String sql = 'SELECT SUM(amount) FROM incomeexpense WHERE status=1';
    List<Map> list = await database!.rawQuery(sql);
    return list;
  }

  Future<List<Map>> totalExpanse()
  async {
    database = await checkDB();
    String sql = 'SELECT SUM(amount) FROM incomeexpense WHERE status=0';
    List<Map> list = await database!.rawQuery(sql);
    return list;
    }
}
