part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {}

class CartItemAdded extends CartEvent {
  const CartItemAdded(this.item);

  final CartItemTblData item;

  @override
  List<Object> get props => [item];
}

class CartItemRemoved extends CartEvent {
  const CartItemRemoved(this.item);

  final CartItemTblData item;

  @override
  List<Object> get props => [item];
}

class CartItemQuantityChanged extends CartEvent {
  const CartItemQuantityChanged(this.item, this.newQuantity);

  final CartItemTblData item;
  final int newQuantity;

  @override
  List<Object> get props => [item, newQuantity];
}