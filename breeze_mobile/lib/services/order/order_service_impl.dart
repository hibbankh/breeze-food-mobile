// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/orders.dart';
import 'order_service.dart';

class OrderServiceImpl implements OrderService {
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  @override
  Future<FoodOrder?> addOrder(Map<String, dynamic> orderData) async {
    try {
      DocumentReference docRef =
          await _store.collection('myorders').add(orderData);
      DocumentSnapshot docSnap = await docRef.get();
      return FoodOrder.fromJson(docSnap.data() as Map<String, dynamic>);
    } catch (e) {
      print('Error adding order: $e');
      return null;
    }
  }

  @override
  Future<List<FoodOrder>> getOrders() async {
    try {
      QuerySnapshot querySnapshot = await _store.collection('myorders').get();
      return querySnapshot.docs
          .map((doc) => FoodOrder.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error getting orders: $e');
      return [];
    }
  }

  @override
  Future<FoodOrder?> getOrderById(String orderId) async {
    try {
      DocumentSnapshot docSnap =
          await _store.collection('myorders').doc(orderId).get();
      return docSnap.exists
          ? FoodOrder.fromJson(docSnap.data() as Map<String, dynamic>)
          : null;
    } catch (e) {
      print('Error getting order by ID: $e');
      return null;
    }
  }

  @override
  Future<void> updateOrder(
      String orderId, Map<String, dynamic> updatedData) async {
    try {
      await _store.collection('myorders').doc(orderId).update(updatedData);
    } catch (e) {
      print('Error updating order: $e');
    }
  }

  @override
  Future<void> deleteOrder(String orderId) async {
    try {
      await _store.collection('myorders').doc(orderId).delete();
    } catch (e) {
      print('Error deleting order: $e');
    }
  }

  @override
  Future<List<FoodOrder>> getOrdersByDate(DateTime date) async {
    try {
      QuerySnapshot querySnapshot = await _store
          .collection('myorders')
          .where('orderDate', isEqualTo: date.toIso8601String())
          .get();
      return querySnapshot.docs
          .map((doc) => FoodOrder.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error getting orders by date: $e');
      return [];
    }
  }
}
