import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app/modules/cart/bloc/cart_bloc.dart';
import 'app/modules/cart/cart_view.dart';
import 'app/modules/favorites/bloc/favorites_bloc.dart';
import 'app/modules/favorites/favorites_view.dart';
import 'app/modules/products_list/bloc/products_list_bloc.dart';
import 'app/modules/products_list/products_list_view.dart';
import 'app/modules/login/login_view.dart';
import 'injection_container.dart';
import 'simple_bloc_observer.dart';
import 'app/db/drift/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();

  // Verify table creation
  await database.customStatement(
    'CREATE TABLE IF NOT EXISTS cart_item_tbl (id INTEGER PRIMARY KEY, title TEXT, price REAL, description TEXT, featured_image TEXT, created_at DATETIME, quantity INTEGER)'
  );
  await database.customStatement(
    'CREATE TABLE IF NOT EXISTS favorites_item_tbl (id INTEGER PRIMARY KEY, title TEXT, price REAL, description TEXT, featured_image TEXT, created_at DATETIME)'
  );

  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final AppDatabase database;

  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsListBloc>(
          create: (_) => ProductsListBloc()..add(ProductsListStarted()),
        ),
        BlocProvider<CartBloc>(
          create: (_) => CartBloc(database: database)..add(CartStarted()),
        ),
        BlocProvider<FavoritesBloc>(
          create: (_) => FavoritesBloc(database: database)..add(FavoritesStarted()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Shopping Mall',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white, // Set the scaffold background color here
        ),
        debugShowCheckedModeBanner: false,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: ResponsiveBreakpoints.builder(
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 1150, name: TABLET),
              const Breakpoint(start: 1151, end: 1920, name: DESKTOP),
            ],
            child: MaxWidthBox(
              maxWidth: 1920,
              child: Builder(builder: (context) {
                final width = ResponsiveValue<double>(context, conditionalValues: [
                  const Condition.equals(name: MOBILE, value: 350),
                  const Condition.equals(name: TABLET, value: 600),
                  const Condition.equals(name: DESKTOP, value: 1200),
                ]).value ?? 350; // Provide a default value if null
                return ResponsiveScaledBox(
                  width: width,
                  child: child!,
                );
              }),
            ),
          ),
        ),
        routerConfig: GoRouter(
          routes: [
            GoRoute(
              path: '/',
              builder: (BuildContext context, GoRouterState state) => const LoginView(),
            ),
            GoRoute(
              path: '/products_list',
              builder: (BuildContext context, GoRouterState state) => const ProductListView(),
            ),
            GoRoute(
              path: '/cart',
              builder: (BuildContext context, GoRouterState state) => const CartView(),
            ),
            GoRoute(
              path: '/favorites',
              builder: (BuildContext context, GoRouterState state) => const FavoritesView(),
            ),
          ],
        ),
      ),
    );
  }
}