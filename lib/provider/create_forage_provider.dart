import 'package:app_forage/models/forage_model.dart';
import 'package:flutter/material.dart';

class CreateForageProvider extends ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  bool _currentlyInSeason = false;
  bool _editMode = false;

  TextEditingController get nameController => _nameController;
  TextEditingController get locationController => _locationController;
  TextEditingController get notesController => _notesController;
  bool get currentlyInSeason => _currentlyInSeason;
  bool get editMode => _editMode;

  void clearTextFields() {
    _nameController.clear();
    _locationController.clear();
    _notesController.clear();
    _currentlyInSeason = false;
    notifyListeners();
  }

  void setForage(ForageModel forage) {
    _nameController.text = forage.name;
    _locationController.text = forage.location;
    _notesController.text = forage.notes;
    _currentlyInSeason = forage.currentlyInSeason;
    _editMode = true;
    notifyListeners();
  }

  void setCurrentlyInSeason(bool value) {
    _currentlyInSeason = value;
    notifyListeners();
  }

  ForageModel createForage() {
    var forage = ForageModel(
      name: _nameController.text,
      location: _locationController.text,
      notes: _notesController.text,
      currentlyInSeason: _currentlyInSeason,
    );
    clearTextFields();
    return forage;
  }
}
