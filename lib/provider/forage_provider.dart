import 'package:app_forage/models/forage_model.dart';
import 'package:flutter/material.dart';

class ForageProvider extends ChangeNotifier {
  final List<ForageModel> _forages = [];

  List<ForageModel> get forages => _forages;

  void addForage(ForageModel forage) {
    _forages.add(forage);
    notifyListeners();
  }

  void updateForage(ForageModel forage, int index) {
    _forages[index] = forage;
    notifyListeners();
  }

  void deleteForage(int index) {
    _forages.removeAt(index);
    notifyListeners();
  }
}
