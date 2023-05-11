import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDA6t6UBP2OJaWlKD37d4ZqhBHvPkMdbYc",
            authDomain: "scaffale-eeae4.firebaseapp.com",
            projectId: "scaffale-eeae4",
            storageBucket: "scaffale-eeae4.appspot.com",
            messagingSenderId: "397023886730",
            appId: "1:397023886730:web:b08ac3ede066365c815c73"));
  } else {
    await Firebase.initializeApp();
  }
}
