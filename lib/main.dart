import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/dish.dart';
import 'package:food_delivery_app/pages/admin.dart';
import 'package:food_delivery_app/pages/initial.dart';
import 'package:food_delivery_app/pages/search.dart';
import 'package:food_delivery_app/pages/shopping_cart.dart';
import 'package:food_delivery_app/pages/store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Ruta inicial
      routes: {
        '/': (context) => InitialScreen(), // Ruta para la pantalla inicial
        '/shop': (context) => Store(), // Ruta para la pantalla de la tienda
        '/search': (context) => SearchScreen(), // Ruta para la pantalla de búsqueda
        '/shopping_cart': (context) => ShoppingCartScreen(cartItems: listOfDishes()), // Ruta para la pantalla del carrito de compras
        '/admin': (context) => AdminScreen(), // Ruta para la pantalla de administrador
        
      },
    );
  }
}
