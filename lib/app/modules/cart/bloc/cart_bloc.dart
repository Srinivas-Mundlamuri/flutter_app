import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_cart/app/db/drift/database.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AppDatabase database;

  CartBloc({required this.database}) : super(CartLoading()) {
    on<CartStarted>(_onStarted);
    on<CartItemAdded>(_onProductAdded);
    on<CartItemRemoved>(_onProductRemoved);
    on<CartItemQuantityChanged>(_onQuantityChanged);
  }

  Future<void> _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());

    try {
      final List<CartItemTblData> cartItemsInDB = await database.getAllCartItems();
      emit(CartLoaded(cartItemsInDB));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onProductAdded(CartItemAdded event, Emitter<CartState> emit) async {
    final state = this.state;

    try {
      await database.insertCartItem(event.item);
      if (state is CartLoaded) {
        emit(CartLoaded([
          ...state.cartProducts,
          event.item,
        ]));
      }
    } catch (error) {
      emit(CartError(error.toString()));
    }
  }

  Future<void> _onProductRemoved(CartItemRemoved event, Emitter<CartState> emit) async {
    final state = this.state;

    try {
      await database.deleteCartItem(event.item.id);
      if (state is CartLoaded) {
        emit(CartLoaded([
          ...state.cartProducts.where((item) => item.id != event.item.id),
        ]));
      }
    } catch (error) {
      emit(CartError(error.toString()));
    }
  }

  Future<void> _onQuantityChanged(CartItemQuantityChanged event, Emitter<CartState> emit) async {
    final state = this.state;

    try {
      final updatedItem = event.item.copyWith(quantity: event.newQuantity);
      await database.updateCartItem(updatedItem);
      if (state is CartLoaded) {
        final updatedProducts = state.cartProducts.map((item) {
          return item.id == event.item.id ? updatedItem : item;
        }).toList();
        emit(CartLoaded(updatedProducts));
      }
    } catch (error) {
      emit(CartError(error.toString()));
    }
  }
}