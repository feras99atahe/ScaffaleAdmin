import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> notifications(String photoUrl, String title) async {
  // Get the FCM token for each user
  String? fcmTokens = await FirebaseMessaging.instance.getToken();

  // Prepare the notification payload
  var notification = {
    'notification': {
      'title': title,
      'body': 'New notification',
      'image': photoUrl,
    },
    'registration_ids': fcmTokens,
  };

  // Send the notification
  try {
    final response = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer YOUR_SERVER_KEY',
      },
      body: jsonEncode(notification),
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error sending notification: $e');
  }
}

