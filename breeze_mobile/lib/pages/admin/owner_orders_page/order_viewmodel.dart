import 'package:map_mvvm/view/viewmodel.dart';

import '../../../models/orders.dart';
import '../../../services/order/order_service.dart';
import '../../../services/order/order_service_impl.dart';

class OrderViewModel extends Viewmodel {
  final OrderService _orderService = OrderServiceImpl();
  List<FoodOrder> _orders = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<FoodOrder> get orders => _orders;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  int get count => _orders.length;

  Future<String> addOrder(Map<String, dynamic> orderData) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      update();
      FoodOrder? newOrder = await _orderService.addOrder(orderData);
      if (newOrder != null) {
        _orders.add(newOrder);
        update();
        return 'Order has been added successfully';
      } else {
        return 'Failed to add order';
      }
    } catch (e) {
      _errorMessage = 'Error adding order: $e';
      return _errorMessage!;
    } finally {
      _isLoading = false;
      update();
    }
  }

  Future<void> deleteOrder(String orderId) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      update();
      await _orderService.deleteOrder(orderId);
      _orders.removeWhere((order) => order.id == orderId);
      update();
    } catch (e) {
      _errorMessage = 'Error deleting order: $e';
    } finally {
      _isLoading = false;
      update();
    }
  }

  Future<void> updateOrder(
      String orderId, Map<String, dynamic> updatedData) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      update();
      await _orderService.updateOrder(orderId, updatedData);
      int index = _orders.indexWhere((order) => order.id == orderId);
      if (index != -1) {
        _orders[index] = FoodOrder.fromJson(updatedData);
        update();
      }
    } catch (e) {
      _errorMessage = 'Error updating order: $e';
    } finally {
      _isLoading = false;
      update();
    }
  }

  Future<void> getAllOrders() async {
    try {
      _isLoading = true;
      _errorMessage = null;
      update();
      final list = await _orderService.getOrders();
      _orders = list;
    } catch (e) {
      _errorMessage = 'Error fetching orders: $e';
    } finally {
      _isLoading = false;
      update();
    }
  }

  Future<void> getOrderById(String orderId) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      update();
      FoodOrder? order = await _orderService.getOrderById(orderId);
      if (order != null) {
        _orders = [order];
        update();
      }
    } catch (e) {
      _errorMessage = 'Error fetching order by ID: $e';
    } finally {
      _isLoading = false;
      update();
    }
  }

  Future<void> getOrdersByDate(DateTime date) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      update();
      final list = await _orderService.getOrdersByDate(date);
      _orders = list;
    } catch (e) {
      _errorMessage = 'Error fetching orders by date: $e';
    } finally {
      _isLoading = false;
      update();
    }
  }

  @override
  void init() {
    getAllOrders();
    super.init();
  }
}
