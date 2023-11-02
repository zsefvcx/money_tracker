// import 'package:money_tracker/core/core.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart'
//         if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart';
//
//
//
// ///https://pub.dev/packages/hive
// ///https://flutterbyexample.com/lesson/singletons
// class DBProvider {
//   DBProvider._internal();
//   static Database? _database;
//
//   static final DBProvider _db = DBProvider._internal();
//   ///синглтон - один он в приложении...
//   ///Его повсемесное использование в приложении плохой тон, но когда надо быстро то можно))
//   ///Без использовния Factory
//   static DBProvider get db => _db;
//
//   Future<Database> get database async => _database ??= await _initDB();
//
//   Future<Database> _initDB() async {
//     final dir = await getApplicationSupportDirectory();
//     final path = '${dir.path}/users_base.db';
//     Logger.print('PathToDB:$path');
//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }
//
//   final String _table = 'UsersTable';
//   final String _image = 'image';
//   final String _locator = 'locator';
//   final String _id = 'id';
//   final String _firstName = 'firstName';
//   final String _name = 'name';
//   final String _lastName = 'lastName';
//   final String _age = 'age';
//   final String _phone = 'phone';
//   final String _uuid = 'uuid';
//
//   Future<void> _createDB(Database db, int version) async {
//     try {
//       await db.execute(
//           'CREATE TABLE "$_table" ( '
//               '"$_id" INTEGER PRIMARY KEY AUTOINCREMENT, '
//               '"$_firstName" TEXT, '
//               '"$_name" TEXT, '
//               '"$_lastName" TEXT, '
//               '"$_age" INTEGER, '
//               '"$_image" TEXT, '
//               '"$_phone" TEXT, '
//               '"$_uuid" TEXT, '
//               '"$_locator" TEXT '
//               ')'
//       );
//     } on Exception catch (e,t){
//       Logger.print('$e\n$t', name: 'err', level: 1, error: true);
//       throw ArgumentError('Error create db!');
//     }
//   }
//
//   ///READ GROUP
//   ///Пока получаем все элементы из списка
//   Future<List<User>> get(int page) async {
//     final db = await database;
//     final List<Map<String, dynamic>> groupsMapList =
//         await db.query(_table,
//           // where: '$_columnId = ?',
//           //whereArgs: [page*10]
//         );
//     final groupList = <User>[];
//
//     for (final element in groupsMapList) {
//       groupList.add(
//           User.fromJson(element)
//       );
//     }
//     return groupList;
//   }
//
//   ///INSERT Group
//   Future<User> insert(User data,
//       {
//         ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
//       }) async {
//     final db = await database;
//
//     //await db.execute('ALTER TABLE "$_groupTable" ADD COLUMN "$_group" TEXT');
//     //await db.execute('ALTER TABLE "$_groupTable" ADD COLUMN "$_description" TEXT');
//     //await db.execute('ALTER TABLE "$_groupTable" ADD COLUMN "$_image" TEXT');
//
//     ///Имя должно быть уникальное
//     final query = await db.query(_table, where: '"$_name" = ?', whereArgs: [data.name]);
//     if (query.isNotEmpty){
//       if (query[0].isNotEmpty){///только первое вхождение
//         final id = query[0][_id];
//         if (id != null && id is int){
//           return data.copyWith(
//             id: id,
//           );
//         }
//       }
//     }
//
//     final id = await db.insert(
//       _table,
//       data.toJson(),
//       conflictAlgorithm: conflictAlgorithm,
//     );
//     return data.copyWith(
//       id: id,
//     );
//   }
//
//   ///UPDATE Group
//   Future<int> update(User data,
//       {
//         ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
//       }) async {
//     final db = await database;
//
//     return await db.update(
//         _table,
//         data.toJson(),
//         where: '"$_id" = ?',
//         whereArgs: [data.id],
//         conflictAlgorithm: conflictAlgorithm,
//     );
//
//   }
//
//   ///DELETE GID
//   Future<int> delete(int gid) async {
//     final db = await database;
//     return await db.delete(
//             _table,
//             where: '"$_id" = ?',
//             whereArgs: [gid]);
//   }
// }
