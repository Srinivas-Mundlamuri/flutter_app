import 'package:drift/drift.dart';

import '../database.dart';

part 'favorites_item_dao.g.dart';

@DriftAccessor(tables: [FavoritesItemTbl])
class FavoritesItemDao extends DatabaseAccessor<AppDatabase> with _$FavoritesItemDaoMixin {
  FavoritesItemDao(AppDatabase db) : super(db);

  // * select QUERIES
  // Get ALL Favorites item data
  Future<List<FavoritesItemTblData>> get selectAllFavoritesItems => select(favoritesItemTbl).get();

  // * insert QUERIES
  // Insert new favorites item
  Future<int> insertFavoritesItem(FavoritesItemTblData entry) {
    return into(favoritesItemTbl).insert(entry);
  }

  // * delete QUERIES
  Future<void> deleteOneProductItem({required int productId}) async {
    await (delete(favoritesItemTbl)..where((tbl) => tbl.id.equals(productId))).go();
  }
}
