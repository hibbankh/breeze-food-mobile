import 'package:breeze_mobile/components/my_button.dart';
import 'package:breeze_mobile/models/cart_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  final UserCard card;

  const PaymentPage({super.key, required this.card});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void _userTappedPay(BuildContext context) {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirm Payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holder Name: $cardHolderName"),
                Text("CVV Code: $cvvCode"),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _submitData(context);
              },
              child: const Text("Yes"),
            ),
          ],
        ),
      );
    }
  }

  void _submitData(BuildContext context) async {
    await _saveCard();
    if (!context.mounted) {
      return;
    }
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DeliveryProgressPage(),
      ),
    );
  }

  Future<void> _saveCard() async {
    try {
      var uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null || uid.isEmpty) {
        return;
      }
      await FirebaseFirestore.instance.collection("cards").doc(uid).set(
            UserCard(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
            ).toJson(),
          );
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    cardNumber = widget.card.cardNumber;
    expiryDate = widget.card.expiryDate;
    cardHolderName = widget.card.cardHolderName;
    cvvCode = widget.card.cvvCode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Checkout"),
      ),
      body: Column(
        children: [
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (p0) {},
          ),
          CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            },
            formKey: formKey,
          ),
          const Spacer(),
          MyButton(
            text: "Pay Now",
            onTap: () => _userTappedPay(context),
          ),
          const SizedBox(height: 1),
        ],
      ),
    );
  }
}

class UserCard {
  late String cardNumber;
  late String expiryDate;
  late String cardHolderName;
  late String cvvCode;

  UserCard({
    this.cardNumber = '',
    this.expiryDate = '',
    this.cardHolderName = '',
    this.cvvCode = '',
  });

  UserCard.fromJson(Map<String, dynamic>? json) {
    cardNumber = json?['cardNumber'] ?? "";
    expiryDate = json?['expiryDate'] ?? "";
    cardHolderName = json?['cardHolderName'] ?? "";
    cvvCode = json?['cvvCode'] ?? "";
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["cardNumber"] = cardNumber;
    data["expiryDate"] = expiryDate;
    data["cardHolderName"] = cardHolderName;
    data["cvvCode"] = cvvCode;
    return data;
  }
}

class UserCards {
  late List<UserCard> items;

  UserCards({
    required this.items,
  });

  UserCards.fromJson(Map<String, dynamic>? json) {
    items = [];
    if (json != null) {
      var aa = json['items'];
      if (aa is List<dynamic>) {
        for (var value in aa) {
          items.add(UserCard.fromJson(value));
        }
      }
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["items"] = items.map((e) => e.toJson());
    return data;
  }
}
