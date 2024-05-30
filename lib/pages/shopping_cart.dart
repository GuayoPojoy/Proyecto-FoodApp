import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/bottom_bar.dart';
import 'package:food_delivery_app/pages/pago.dart'; 
import '../models/dish.dart';

class ShoppingCartScreen extends StatefulWidget {
  final List<Dish> cartItems;

  const ShoppingCartScreen({Key? key, required this.cartItems}) : super(key: key);

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  int total = 0;

  @override
  void initState() {
    super.initState();
    calculateTotal();
  }

  void calculateTotal() {
    int sum = 0;
    for (var dish in widget.cartItems) {
      sum += dish.price;
    }
    setState(() {
      total = sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orden'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final dish = widget.cartItems[index];
                return ListTile(
                  title: Text(dish.name),
                  subtitle: Text('${dish.price}'),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/${dish.image}'),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          // Lógica para eliminar un platillo del carrito
                          setState(() {
                            widget.cartItems.removeAt(index);
                            calculateTotal();
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          // Lógica para agregar más cantidad de un platillo al carrito
                          setState(() {
                            // Por simplicidad, vamos a suponer que el precio no cambia
                            widget.cartItems.add(dish);
                            calculateTotal();
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \Q. $total', // Muestra el total de la compra
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navega a la pantalla de pago
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentScreen()),
                    );
                  },
                  child: Text('Pagar'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: 2,
        onTabSelected: (index) {
          if (index != 2) {
            Navigator.of(context).pushReplacementNamed(
              index == 0 ? '/shop' : '/search',
            );
          } else {
            print('Selected shopping cart');
          }
        },
      ),
    );
  }
}