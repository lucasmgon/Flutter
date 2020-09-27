import 'package:flutter/cupertino.dart';

class Configuracao extends ChangeNotifier {
  bool _darkStatus = false;

  isDark() => _darkStatus;

  setDarkStatus(bool status) {
    _darkStatus = status;

    notifyListeners();
  }
}