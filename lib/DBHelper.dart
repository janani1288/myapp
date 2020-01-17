import 'dart:io';

import 'package:myapp/WebServiceHelper.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'AppLevelStaticValues.dart';
import 'ModelClasses.dart';


class DBHelper {

  // make this a singleton class
  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  loadInitialData() async{
    Database db = await instance.database;
  }



  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, AppValues.databaseName);
    return await openDatabase(path,
        version: AppValues.databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await loadRoleData(db,version);
    await loadUsersData(db);
    //TODO: load other initial data like labour category
  }

  Future loadRoleData(Database db, int version) async{
    //List<User> userDataList = await WebServiceHelper.getUserList();


    await db.execute("CREATE TABLE "+AppValues.roleTableName+" ("
        "id INTEGER PRIMARY KEY,"
        "role_name TEXT"
        ")");
    print('Created Role table');

    List<Role> roles = await WebServiceHelper.getDummyRoles();
    await _insertRoles(db, roles);
    print('Inserted Roles');
  }

  Future loadUsersData(Database db) async {
    await db.execute("CREATE TABLE "+AppValues.userTableName+" ("
        "id INTEGER PRIMARY KEY,"
        "user_name TEXT,"
        "password TEXT,"
        "first_name TEXT,"
        "last_name TEXT,"
        "is_active INTEGER,"
        "role_id INTEGER ,"
        "FOREIGN KEY (role_id) REFERENCES role (id)"
        " ON DELETE NO ACTION ON UPDATE NO ACTION"
        ")");
    print('Created User table');

    List<User> users = await WebServiceHelper.fetchUsers();
    await _insertUsers(db, users);
    print('Inserted Users');
  }

  _insertRoles(Database db, List<Role> roles) async{

    roles.forEach((role)=>
      db.rawInsert(
        "INSERT into "+AppValues.roleTableName+" (id,role_name)"
            " VALUES (?,?)",
        [role.id, role.roleName])
    );

  }

  _insertUsers(Database db, List<User> users) async{
    users.forEach((user)=>
        db.rawInsert(
            "INSERT into "+AppValues.userTableName+" (id,user_name,password,first_name,last_name,is_active,role_id)"
                " VALUES (?,?,?,?,?,?,?)",
            [user.id, user.userName, user.password, user.firstName,user.lastName,user.isActive?1:0, user.roleId])
    );

  }

  static Future<User> getUser(String username) async {
    final db = await instance.database;
    var res = await db.query(AppValues.userTableName, where: "user_name = ?", whereArgs: [username]);
    return res.isNotEmpty ? User.fromJson(res.first) : null;
  }

}