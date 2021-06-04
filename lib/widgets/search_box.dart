import 'package:address_book/view_models/contacts_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            border: const OutlineInputBorder(), labelText: 'Search Contacts'),
        onChanged: (value) {
          context.read<ContactsViewModel>().updateFilterContacts(value.trim());
        },
      ),
    );
  }
}
