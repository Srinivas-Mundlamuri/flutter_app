import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DataClassName('CartItemTblData')
class CartItemTbl extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  RealColumn get price => real()();
  TextColumn get description => text()();
  TextColumn get featuredImage => text()();
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get quantity => integer().withDefault(const Constant(1))(); // Add quantity field
}

@DataClassName('FavoritesItemTblData')
class FavoritesItemTbl extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  RealColumn get price => real()();
  TextColumn get description => text()();
  TextColumn get featuredImage => text()();
  DateTimeColumn get createdAt => dateTime()();
}

@DriftDatabase(tables: [CartItemTbl, FavoritesItemTbl])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
      );

  Future<List<CartItemTblData>> getAllCartItems() => select(cartItemTbl).get();
  Future insertCartItem(CartItemTblData item) => into(cartItemTbl).insert(item);
  Future deleteCartItem(int id) => (delete(cartItemTbl)..where((tbl) => tbl.id.equals(id))).go();

  Future<List<FavoritesItemTblData>> getAllFavoritesItems() => select(favoritesItemTbl).get();
  Future insertFavoritesItem(FavoritesItemTblData item) => into(favoritesItemTbl).insert(item);
  Future deleteFavoritesItem(int id) => (delete(favoritesItemTbl)..where((tbl) => tbl.id.equals(id))).go();

  Future updateCartItem(CartItemTblData item) => update(cartItemTbl).replace(item); // Add updateCartItem method
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    print("Database file path: ${file.path}");
    return NativeDatabase(file);
  });
}