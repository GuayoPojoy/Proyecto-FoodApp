import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/dish.dart';

class CustomDish extends StatefulWidget {
  final Dish dish;

  const CustomDish({required this.dish, Key? key}) : super(key: key);

  @override
  _CustomDishState createState() => _CustomDishState();
}

class _CustomDishState extends State<CustomDish> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 120, // Altura fija de la tarjeta
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen
                Container(
                  width: 120, // Ancho fijo de la imagen
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/${widget.dish.image}"),
                    ),
                  ),
                ),
                // Contenido
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Nombre del plato
                        Text(
                          widget.dish.name,
                          style: const TextStyle(
                            color: Color(0xFF1F2B2E),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Nombre de la tienda
                        Text(
                          widget.dish.store,
                          style: const TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 12,
                          ),
                        ),
                        // Precio
                        Text(
                          "\$${widget.dish.price}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1F2B2E),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Botón de agregar
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    isPressed = true;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    isPressed = false;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    isPressed = false;
                  });
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isPressed ? Colors.red : Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
