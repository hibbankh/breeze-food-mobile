import 'package:breeze_mobile/components/my_button.dart';
import 'package:breeze_mobile/components/my_cart_tile.dart';
import 'package:breeze_mobile/models/restaurant.dart';
import 'package:breeze_mobile/pages/payment_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final userCart = restaurant.cart;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title:
                        const Text("Are you sure you want to clear your cart?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          restaurant.clearCart();
                        },
                        child: const Text("Yes"),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? const Expanded(
                          child: Center(
                            child: Text("Your cart is empty.."),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: userCart.length,
                            itemBuilder: (context, index) {
                              final cartItem = userCart[index];
                              return MyCartTile(cartItem: cartItem);
                            },
                          ),
                        ),
                ],
              ),
            ),
            MyButton(
                text: "Go to checkout",
                onTap: () async {
                  var userCard = await _getCard();
                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(
                          card: userCard,
                        ),
                      ),
                    );
                  }
                })
          ],
        ),
      );
    });
  }

  Future<UserCard> _getCard() async {
    try {
      var uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null || uid.isEmpty) {
        return UserCard();
      }
      var res =
          await FirebaseFirestore.instance.collection("cards").doc(uid).get();
      return UserCard.fromJson(res.data());
    } catch (e) {
      print(e);
    }
    return UserCard();
  }
}
