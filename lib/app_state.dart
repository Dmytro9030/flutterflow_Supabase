import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _activeWo = prefs.getInt('ff_activeWo') ?? _activeWo;
    });
    _safeInit(() {
      _activeCustomer = prefs.getInt('ff_activeCustomer') ?? _activeCustomer;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _activeWo = 0;
  int get activeWo => _activeWo;
  set activeWo(int value) {
    _activeWo = value;
    prefs.setInt('ff_activeWo', value);
  }

  int _activeCustomer = 0;
  int get activeCustomer => _activeCustomer;
  set activeCustomer(int value) {
    _activeCustomer = value;
    prefs.setInt('ff_activeCustomer', value);
  }

  int _loopCount = 0;
  int get loopCount => _loopCount;
  set loopCount(int value) {
    _loopCount = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
