import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:food_delivery_app/widgets/bottom_bar.dart';
import '../models/dish.dart';
import '../widgets/custom_dish.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<Dish> _dishes;
  late List<Dish> _filteredDishes;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _dishes = listOfDishes();
    _filteredDishes = _dishes;
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredDishes = _dishes.where((dish) {
        return dish.name.toLowerCase().contains(query) ||
            dish.store.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCFC),
      appBar: AppBar(
        title: const Text('Buscar'),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(FeatherIcons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar plato...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _filteredDishes.length,
              itemBuilder: (context, index) {
                final dish = _filteredDishes[index];
                return GestureDetector(
                  onTap: () {
                    // Acción al hacer clic en la tarjeta (opcional)
                  },
                  child: CustomDish(
                    dish: dish,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: 1,
        onTabSelected: (index) {
          if (index != 1) {
            Navigator.of(context).pushReplacementNamed(
              index == 0 ? '/shop' : '/shopping_cart',
            );
          } else {
            print('Seleccionado el ícono de búsqueda');
          }
        },
      ),
    );
  }
}
