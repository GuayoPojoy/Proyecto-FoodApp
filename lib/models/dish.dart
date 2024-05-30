class Dish {
  String name;
  String store;
  String image; 
  int price;

  Dish({
    required this.name,
    required this.store,
    required this.image,
    required this.price,
  });
}

List<Dish> listOfDishes() {
  return [
    Dish(
        name: "Hamburguesa",
        store: "BCHesse",
        image: "dish1.png",
        price: 25),
    Dish(
        name: "Fried Chiness Rice",
        store: "Chiness Su'Cafe",
        image: "dish2.png",
        price: 25),
    Dish(
        name: "Fried Chiness Rice",
        store: "Chiness Su'Cafe",
        image: "dish3.png",
        price: 25),
    Dish(
        name: "Fried Chiness Rice",
        store: "Chiness Su'Cafe",
        image: "dish4.png",
        price: 25),
    Dish(
        name: "Fried Chiness Rice",
        store: "Chiness Su'Cafe",
        image: "dish4.png",
        price: 25),
    Dish(
        name: "Fried Chiness Rice",
        store: "Chiness Su'Cafe",
        image: "dish4.png",
        price: 25),
  ];
}