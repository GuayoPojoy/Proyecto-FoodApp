import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/search.dart';
import 'package:food_delivery_app/widgets/bottom_bar.dart';
import '../sections/store/hero.dart';
import '../sections/store/store_dishes.dart'; // Importamos la nueva versión de StoreDishes

class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCFC),
      body: _getBody(_selectedIndex),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: _selectedIndex,
        onTabSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _navigateToScreen(context, index);
        },
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return SingleChildScrollView(
          child: Column(
            children: [
              const CustomHero(),
              const SizedBox(height: 32),
              StoreDishes(), // Usamos la nueva versión de StoreDishes
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        );
      case 1:
        return const SearchScreen();
      default:
        return Container();
    }
  }

  void _navigateToScreen(BuildContext context, int index) {
    String routeName = '';
    switch (index) {
      case 0:
        routeName = '/shop';
        break;
      case 1:
        routeName = '/search';
        break;
      case 2:
        routeName = '/shopping_cart';
        break;
      case 3:
        routeName = '/admin';
        break;
      default:
        routeName = '/shop';
        break;
    }
    Navigator.pushNamed(context, routeName);
  }
}