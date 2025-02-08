part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class FavoritesStarted extends FavoritesEvent {}

class FavoritesItemAdded extends FavoritesEvent {
  const FavoritesItemAdded(this.item);

  final FavoritesItemTblData item;

  @override
  List<Object> get props => [item];
}

class FavoritesItemRemoved extends FavoritesEvent {
  const FavoritesItemRemoved(this.item);

  final FavoritesItemTblData item;

  @override
  List<Object> get props => [item];
}