// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:flutter/foundation.dart' show compute;
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/isolates.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

Future<void> downloadFile(String url, String filename) async {
  print('url');
  final url = 'url';
  final filename = 'filename';

  // Get the app's download directory
  final directory = await getExternalStorageDirectory();

  // Set up the download task
  final taskId = await FlutterDownloader.enqueue(
    url: url,
    savedDir: directory!.path,
    fileName: filename,
    showNotification: true,
    openFileFromNotification: true,
  );

  // Listen for updates to the download task
  FlutterDownloader.registerCallback((id, status, progress) {
    if (taskId == id && status == DownloadTaskStatus.complete) {
      // Download is complete
      debugPrint('Download complete!');
    }
  });
}
