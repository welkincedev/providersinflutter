import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  String? _userName;

  bool get isLoggedIn => _userName != null;
  String? get userName => _userName;
  String get displayName => _userName ?? "Guest";

  void login(String name){
    _userName = name.trim().isEmpty ? "User" : name.trim();
    notifyListeners();
  }

  void logout(){
    _userName = null;
    notifyListeners();
  }
}