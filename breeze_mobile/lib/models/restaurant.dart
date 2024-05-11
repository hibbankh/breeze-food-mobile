import 'package:breeze_mobile/models/cart_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  // list of menu
  final Set<Food> _menu = {
    // rice
    Food(
      name: "Fried Rice Beef",
      description:
          "Cooked rice mix with seasonings, eggs, vegetables and tender beef slices.",
      imagePath: "lib/images/rice/fried_rice_beef.jpg",
      price: 8,
      category: FoodCategory.rice,
      availableAddons: [
        Addon(name: "Fried Egg", price: 1.5),
        Addon(name: "Omellet", price: 2),
      ],
    ),
    Food(
      name: "Fried Rice Egg",
      description: "Cooked rice mix with seasonings, eggs and vegetables.",
      imagePath: "lib/images/rice/fried_rice_egg.jpg",
      price: 4,
      category: FoodCategory.rice,
      availableAddons: [
        Addon(name: "Fried Egg", price: 1.5),
        Addon(name: "Omellet", price: 2),
      ],
    ),
    Food(
      name: "Fried Rice Lamb",
      description:
          "Cooked rice mix with seasonings, eggs, vegetables and juicy lamb.",
      imagePath: "lib/images/rice/fried_rice_lamb.jpg",
      price: 9,
      category: FoodCategory.rice,
      availableAddons: [
        Addon(name: "Fried Egg", price: 1.5),
        Addon(name: "Omellet", price: 2),
      ],
    ),
    Food(
      name: "Pattaya Rice",
      description:
          "Exotic Pattaya-style fried rice wrapped in a thin omelette.",
      imagePath: "lib/images/rice/pattaya_rice.jpg",
      price: 7,
      category: FoodCategory.rice,
      availableAddons: [
        Addon(name: "Chicken", price: 4),
        Addon(name: "Beef", price: 5),
        Addon(name: "Lamb", price: 6),
      ],
    ),
    Food(
      name: "Plain Rice",
      description: "Simple yet comforting plain steamed rice.",
      imagePath: "lib/images/rice/plain_rice.jpg",
      price: 2,
      category: FoodCategory.rice,
      availableAddons: [
        Addon(name: "Chicken", price: 4),
        Addon(name: "Beef", price: 5),
        Addon(name: "Lamb", price: 6),
        Addon(name: "Fried Egg", price: 1.5),
        Addon(name: "Omellet", price: 2),
      ],
    ),

    //noodles
    Food(
      name: "Fried Indomie Original",
      description:
          "Classic Indomie noodles fried with traditional spices and a hint of vegetables.",
      imagePath: "lib/images/mee/fried_indomie_original.png",
      price: 5,
      category: FoodCategory.noodles,
      availableAddons: [
        Addon(name: "Fried Egg", price: 1.5),
        Addon(name: "Omellet", price: 2),
      ],
    ),
    Food(
      name: "Fried Kueyteow",
      description:
          "Stir-fried Kueyteow noodles with a vegetables and soy sauce.",
      imagePath: "lib/images/mee/fried_kueyteow.jpg",
      price: 5,
      category: FoodCategory.noodles,
      availableAddons: [
        Addon(name: "Fried Egg", price: 1.5),
        Addon(name: "Omellet", price: 2),
      ],
    ),
    Food(
      name: "Fried Maggi Mamak",
      description:
          "Maggi noodles tossed with vegetables, eggs, and spices in Mamak style.",
      imagePath: "lib/images/mee/fried_meggie_mamak.jpg",
      price: 6,
      category: FoodCategory.noodles,
      availableAddons: [
        Addon(name: "Fried Egg", price: 1.5),
        Addon(name: "Omellet", price: 2),
      ],
    ),
    Food(
      name: "Maggi Curry Soup",
      description:
          "Rich and spicy Maggi noodle soup, served with a hearty curry broth.",
      imagePath: "lib/images/mee/maggi_curry_soup.jpg",
      price: 6,
      category: FoodCategory.noodles,
      availableAddons: [
        Addon(name: "Fried Egg", price: 1.5),
        Addon(name: "Omellet", price: 2),
      ],
    ),
    //sides
    Food(
      name: "Curry Beef",
      description:
          "Tender beef chunks slowly cooked in a rich and aromatic curry sauce.",
      imagePath: "lib/images/sides/curry_beef.jpg",
      price: 5,
      category: FoodCategory.sides,
      availableAddons: [],
    ),
    Food(
      name: "Curry Chicken",
      description:
          "Chicken meat slowly cooked in a rich and aromatic curry sauce.",
      imagePath: "lib/images/sides/curry_chicken.jpeg",
      price: 5,
      category: FoodCategory.sides,
      availableAddons: [],
    ),
    Food(
      name: "Fried Chicken",
      description:
          "Crispy on the outside, juicy on the inside, this fried chicken is marinated in spices and deep-fried.",
      imagePath: "lib/images/sides/fried_chicken.jpg",
      price: 5,
      category: FoodCategory.sides,
      availableAddons: [],
    ),
    Food(
      name: "Fried Potato",
      description:
          "A Deep-fried potatoes that have been cut into small pieces and fried until golden brown.",
      imagePath: "lib/images/sides/fried_potato.jpg",
      price: 5,
      category: FoodCategory.sides,
      availableAddons: [],
    ),
    Food(
      name: "Soysauce Chicken",
      description:
          "Chicken meat slowly cooked in a rich and aromatic soy sauce.",
      imagePath: "lib/images/sides/soysauce_chicken.png",
      price: 5,
      category: FoodCategory.sides,
      availableAddons: [],
    ),
    //drinks
    Food(
      name: "Coffee",
      description:
          "A rich, aromatic coffee drink, perfect for a warm and cozy day.",
      imagePath: "lib/images/drinks/coffee.jpg",
      price: 2,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Ice coffee", price: 0.5),
      ],
    ),
    Food(
      name: "Milo",
      description:
          "Chilled Milo drink, a favorite for its rich chocolatey flavor and refreshing taste.",
      imagePath: "lib/images/drinks/ice_milo.png",
      price: 3,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Ice Milo", price: 0.5),
      ],
    ),
    Food(
      name: "Fresh Milk",
      description: "Fresh milk served with a dash of vanilla essence.",
      imagePath: "lib/images/drinks/milk.png",
      price: 2,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),
    Food(
      name: "Sirap Bandung",
      description:
          "A refreshing drink made from coconut milk, sugar, and a hint of lime juice.",
      imagePath: "lib/images/drinks/sirap_bandung.jpg",
      price: 2.5,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Soda", price: 1.5),
      ],
    ),
    Food(
      name: "Tea Tarik",
      description:
          "Malaysia's famous 'pulled' tea, creamy and frothy, served hot or cold.",
      imagePath: "lib/images/drinks/tea_tarik.jpg",
      price: 2,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Ice Tea Tarik", price: 1),
      ],
    ),
  };
  // user cart
  final List<CartItem> _cart = [];

  // delivery address can change or update
  String _deliveryAddress = 'Center Point';

  //G E T T E R S
  Set<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  //O P E R A T I O N S

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  //H E L P E R S
  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt.");
    receipt.writeln();

    String formattedDate =
        DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-----------");
    receipt.writeln("Order Details");
    receipt.writeln("-----------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("Addons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("-----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln("Delivery Address: $deliveryAddress");
    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "\RM${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
