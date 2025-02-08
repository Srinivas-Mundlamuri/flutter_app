import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../db/drift/database.dart';
import '../../models/models.dart';
import '../cart/bloc/cart_bloc.dart';
import '../favorites/bloc/favorites_bloc.dart';
import 'bloc/products_list_bloc.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: const Color(0xFF527cff),
        centerTitle: true,
        title: const Text(
          "Shopping Mall",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        actions: [
          // Favorites Icon
          IconButton(
            padding: const EdgeInsets.only(right: 10),
            constraints: const BoxConstraints(),
            icon: BlocBuilder<FavoritesBloc, FavoritesState>(
              builder: (context, state) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 20,
                    ),
                    if (state is FavoritesLoaded && state.favoritesProducts.isNotEmpty)
                      Positioned(
                        top: -5,
                        right: -5,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: Colors.red,
                          child: Text(state.favoritesProducts.length.toString(),
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.white)),
                        ),
                      ),
                  ],
                );
              },
            ),
            onPressed: () {
              context.push(Uri(path: "/favorites").toString());
            },
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 10),
            constraints: const BoxConstraints(),
            icon: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 20,
                    ),
                    if (state is CartLoaded && state.cartProducts.isNotEmpty)
                      Positioned(
                          top: -5,
                          right: -5,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.red,
                            child: Text(state.cartProducts.length.toString(),
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.white)),
                          ))
                  ],
                );
              },
            ),
            onPressed: () {
              context.push(Uri(path: "/cart").toString());
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white, size: 20),
            onPressed: () {
              // Add logout logic here (e.g., clear auth session)
              // Navigate to login page
              context.go('/');
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductsListBloc, ProductsListState>(
        builder: (context, state) {
          return RefreshIndicator(onRefresh: () async {
            if (state is ProductsListError || state is ProductsListLoaded) {
              BlocProvider.of<ProductsListBloc>(context)
                  .add(ProductsListStarted());
              return Future(() => true);
            }
            return Future.value(null);
          }, child: LayoutBuilder(builder: (context, constrains) {
            bool isLandscape =
                MediaQuery.of(context).orientation == Orientation.landscape;

            int crossAxisCount = isLandscape ? 3 : 2;

            if (state is ProductsListLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if (state is ProductsListError) {
              return SingleChildScrollView(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                          child: Text(
                        "Something went wrong",
                        style: TextStyle(fontSize: 14),
                      ))));
            }
            if (state is ProductsListLoaded) {
           return GridView.builder(
  padding: const EdgeInsets.all(15),
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: crossAxisCount,
    mainAxisSpacing: 15.0,
    crossAxisSpacing: 15.0,
    childAspectRatio: 1.0,
  ),
  itemCount: state.products.length,
  itemBuilder: (context, index) {
    final currentProduct = state.products[index];
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(3, 3),
            blurRadius: 5,
          ),
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(-1, -1),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              child: FadeInImage.assetNetwork(
                image: currentProduct.thumbnail,
                placeholder: "assets/product-placeholder.png",
                imageErrorBuilder: (context, error, stackTrace) =>
                    Image.asset("assets/product-placeholder.png"),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Product Title
                  Expanded(
                    child: Tooltip(
                      message: currentProduct.description,
                      waitDuration: const Duration(milliseconds: 500),
                      child: Text(
                        currentProduct.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),

                  // Product Price
                  Text(
                    "\$${currentProduct.price.toStringAsFixed(2)} ",
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),

                  // Add to Cart Button
                  AddToCartButton(productItem: currentProduct),

                  const SizedBox(width: 5),

                  // Add to Favorites Button
                  AddToFavoritesButton(productItem: currentProduct),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  },
);


                         

      }
      return TextButton(
          onPressed: () {
            BlocProvider.of<ProductsListBloc>(context)
                .add(ProductsListStarted());
          },
          child: const Text(
            "Retry",
          ));
            }));
          },
        ),
      );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.productItem});

  final ProductItem productItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const SizedBox();
        }
        if (state is CartError) {
          if (kDebugMode) {
            print('cart error');
          }
          return const SizedBox();
        }
        if (state is CartLoaded) {
          final isInCart = state.cartProducts
              .map((e) => e.id)
              .any((element) => element == productItem.id);

          return IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            splashRadius: 20,
            icon: Icon(
              isInCart ? Icons.check : Icons.shopping_cart,
              color: Colors.black,
              size: 22,
            ),
            onPressed: () {
              if (!isInCart) {
                context.read<CartBloc>().add(CartItemAdded(CartItemTblData(
                  id: productItem.id,
                  title: productItem.title,
                  createdAt: DateTime.now(),
                  featuredImage: productItem.thumbnail,
                  price: productItem.price.toDouble(),
                  description: productItem.description,
                  quantity: 1,
                )));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${productItem.title} added to cart',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    action: SnackBarAction(
                      label: 'Dismiss',
                      textColor: Colors.white,
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                    ),
                  ),
                );
              }
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
class AddToFavoritesButton extends StatelessWidget {
  const AddToFavoritesButton({super.key, required this.productItem});

  final ProductItem productItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoading || state is FavoritesError) return const SizedBox();

        if (state is FavoritesLoaded) {
          final isInFavorites = state.favoritesProducts.any((e) => e.id == productItem.id);

          return IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            splashRadius: 20,
            icon: Icon(
              isInFavorites ? Icons.favorite : Icons.favorite_border,
              color: isInFavorites ? Colors.red : Colors.black,
              size: 22,
            ),
            onPressed: () {
              if (isInFavorites) {
                // Remove from favorites
                final favoriteItem = state.favoritesProducts.firstWhere((item) => item.id == productItem.id);
                context.read<FavoritesBloc>().add(FavoritesItemRemoved(favoriteItem));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${productItem.title} removed from favorites',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    action: SnackBarAction(
                      label: 'Dismiss',
                      textColor: Colors.white,
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                    ),
                  ),
                );
              } else {
                // Add to favorites
                context.read<FavoritesBloc>().add(FavoritesItemAdded(FavoritesItemTblData(
                  id: productItem.id,
                  title: productItem.title,
                  createdAt: DateTime.now(),
                  featuredImage: productItem.thumbnail,
                  price: productItem.price.toDouble(),
                  description: productItem.description,
                )));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${productItem.title} added to favorites',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.orange,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    action: SnackBarAction(
                      label: 'Dismiss',
                      textColor: Colors.white,
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                    ),
                  ),
                );
              }
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}