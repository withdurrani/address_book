import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:address_book/view_models/contacts_view_model.dart';

import 'views/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ContactsViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Address Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
