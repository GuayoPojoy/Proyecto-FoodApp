import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/custom_dish.dart'; // Importamos la nueva versión de CustomDish
import '../../models/dish.dart'; // Importamos el modelo de plato

class StoreDishes extends StatelessWidget {
  const StoreDishes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Dish> dishes = listOfDishes(); // Supongamos que tienes una función que devuelve una lista de platos

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Ajustamos los márgenes
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: dishes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16), // Añadimos un margen inferior entre las tarjetas
            child: CustomDish(
              dish: dishes[index],
            ),
          );
        },
      ),
    );
  }
}
