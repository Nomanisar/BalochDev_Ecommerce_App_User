import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopsmart_users_en/models/order_model.dart';

class OrderProvider with ChangeNotifier {
  final List<OrdersModelAdvanced> orders = [];
  List<OrdersModelAdvanced> get getOrders => orders;

  Future<List<OrdersModelAdvanced>> fetchOrder() async {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    var uid = user!.uid;
    try {
      await FirebaseFirestore.instance
          .collection("ordersAdvanced")
          .where('userId', isEqualTo: uid)
          .orderBy("orderDate", descending: false)
          .get()
          .then((orderSnapshot) {
        orders.clear();
        for (var element in orderSnapshot.docs) {
          orders.insert(
            0,
            OrdersModelAdvanced(
              orderId: element.get('orderId'),
              productId: element.get('productId'),
              userId: element.get('userId'),
              price: element.get('price').toString(),
              productTitle: element.get('productTitle').toString(),
              quantity: element.get('quantity').toString(),
              imageUrl: element.get('imageUrl'),
              userName: element.get('userName'),
              orderDate: element.get('orderDate'),
            ),
          );
        }
      });
      return orders;
    } catch (e) {
      rethrow;
    }
  }
}
