// lib/product_provider.dart

import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  // List of products to store
  List<Product> _products = [];

  List<Product> get products => _products;

  // Method to fetch products and notify listeners
  void fetchProducts() {
    // Simulate a fetch from an API or some data source
    _products = [
      Product(title: 'Product 1', price: 10.0),
      Product(title: 'Product 2', price: 20.0),
    ];
    notifyListeners();
  }
}

// Product class definition
class Product {
  final String title;
  final double price;

  Product({required this.title, required this.price});
}
