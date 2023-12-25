import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  final String userId, userName, userImage, userEmail;
  final Timestamp createdAt;
  final List userCart, userWish;
  UserModel({
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.userEmail,
    required this.userCart,
    required this.userWish,
    required this.createdAt,
  });
}
