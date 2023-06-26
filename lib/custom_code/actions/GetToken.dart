import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scaffale_admin/custom_code/actions/SendNotification.dart';


// Function to retrieve user tokens and save them in Firestore
Future<List<String>> GetTokens() async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final QuerySnapshot querySnapshot =
  await firestore.collection('user_tokens').get();

  final List<String> tokens = [];

  querySnapshot.docs.forEach((doc) {
    final data = doc.data() as Map<String, dynamic>; // Cast data to Map<String, dynamic>
    final token = data['token'] as String; // Access 'token' key
    tokens.add(token);
  });

  return tokens;
}
