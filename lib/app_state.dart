import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool _value) {
    _searchActive = _value;
  }

  bool _approvedreject = false;
  bool get approvedreject => _approvedreject;
  set approvedreject(bool _value) {
    _approvedreject = _value;
  }

  bool _addtoscaffale = false;
  bool get addtoscaffale => _addtoscaffale;
  set addtoscaffale(bool _value) {
    _addtoscaffale = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
