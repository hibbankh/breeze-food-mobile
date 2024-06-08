import 'cart_item.dart';

class FoodOrder {
  String? id; // Firestore document ID
  late List<CartItem> items;
  late DateTime orderDate;
  late double totalPrice;
  String? specialInstructions; // New field for special instructions

  FoodOrder({
    this.id,
    required this.items,
    required this.orderDate,
    required this.totalPrice,
    this.specialInstructions,
  });

  String? get orderId => id;
  List<CartItem> get orderItems => List.unmodifiable(items);
  DateTime get orderDateTime => orderDate;
  double get orderTotalPrice => totalPrice;
  String? get orderSpecialInstructions => specialInstructions;

  FoodOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    items =
        (json['items'] as List).map((item) => CartItem.fromJson(item)).toList();
    orderDate = DateTime.parse(json['orderDate']);
    totalPrice = json['totalPrice'];
    specialInstructions = json['specialInstructions'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'items': items.map((item) => item.toJson()).toList(),
      'orderDate': orderDate.toIso8601String(),
      'totalPrice': totalPrice,
      'specialInstructions': specialInstructions,
    };
  }
}
