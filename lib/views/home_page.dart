import 'package:address_book/widgets/group_view.dart';
import 'package:address_book/widgets/search_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      body: GestureDetector(
        //work around to dissmiss the keyboard when click outside the search box
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Column(
          children: [
            SizedBox(height: 80, child: SearchBox()),
            Expanded(child: GroupView()),
          ],
        ),
      ),
    );
  }
}
