// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'index.dart';

notifications(String booktitle) {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
    id: 1,
    channelKey: 'basic_channel',
    body: booktitle,
    title: 'New Document add to Scaffale',
    displayOnForeground: true,
  ));
}
