import 'package:address_book/data/contact_list.dart';
import 'package:flutter/material.dart';

class ContactsViewModel extends ChangeNotifier {
  List<String> _myContacts = [];
  List<String> _filteredContacts = [];

  List<String> get myContacts => _myContacts;
  List<String> get filteredContacts => _filteredContacts;

  Future<List<String>> _fetchContacts() {
    //Adding delay just to mock the real time scenario
    return Future.delayed(Duration(seconds: 2), () => contacts);
  }

  Future<List<String>> getContacts() async {
    //use the cache contacts if we already have contact list
    _myContacts = _myContacts.length > 0 ? _myContacts : await _fetchContacts();
    _filteredContacts = _myContacts;
    notifyListeners();
    return _myContacts;
  }

  void updateFilterContacts(String filter) {
    _filteredContacts = _myContacts
        .where(
            (contact) => contact.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
