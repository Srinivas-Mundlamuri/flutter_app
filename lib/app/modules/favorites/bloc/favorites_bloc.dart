import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_cart/app/db/drift/database.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final AppDatabase database;

  FavoritesBloc({required this.database}) : super(FavoritesLoading()) {
    on<FavoritesStarted>(_onStarted);
    on<FavoritesItemAdded>(_onProductAdded);
    on<FavoritesItemRemoved>(_onProductRemove);
  }

  Future<void> _onStarted(FavoritesStarted event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoading());

    try {
      final List<FavoritesItemTblData> favoritesItemsInDB =
          await database.getAllFavoritesItems();
      emit(FavoritesLoaded(favoritesProducts: favoritesItemsInDB));
    } catch (e) {
      emit(FavoritesError(message: e.toString()));
    }
  }

  Future<void> _onProductAdded(FavoritesItemAdded event, Emitter<FavoritesState> emit) async {
    final state = this.state;

    try {
      await database.insertFavoritesItem(event.item);
      if (state is FavoritesLoaded) {
        emit(FavoritesLoaded(favoritesProducts: [
          ...state.favoritesProducts,
          event.item,
        ]));
      }
    } catch (error) {
      emit(FavoritesError(message: error.toString()));
    }
  }

  Future<void> _onProductRemove(FavoritesItemRemoved event, Emitter<FavoritesState> emit) async {
    final state = this.state;

    try {
      await database.deleteFavoritesItem(event.item.id);
      if (state is FavoritesLoaded) {
        emit(FavoritesLoaded(favoritesProducts: [
          ...state.favoritesProducts.where((item) => item.id != event.item.id),
        ]));
      }
    } catch (error) {
      emit(FavoritesError(message: error.toString()));
    }
  }
}