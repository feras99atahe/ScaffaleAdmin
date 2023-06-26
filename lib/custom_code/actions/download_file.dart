/*
import 'package:http/http.dart' as http;
import 'dart:io';

Future<void> downloadFile(String url, String savePath) async {
  try {
    var response = await http.get(Uri.parse(url));
    var file = File(savePath);
    await file.writeAsBytes(response.bodyBytes);
    print('File downloaded successfully!');
  } catch (e) {
    print('Error downloading file: $e');
  }
}
*/
//another code

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

Future<void> downloadFile(String url, String fileName) async {
  try {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      var response = await http.get(Uri.parse(url));
      var directoryPath = '/storage/emulated/0/Download';
      var filePath = '$directoryPath/$fileName';
      var file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      print('File downloaded successfully! Saved at: $filePath');
    } else {
      print('Permission denied');
    }
  } catch (e) {
    print('Error downloading file: $e');
  }
}




