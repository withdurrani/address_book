import 'package:address_book/view_models/contacts_view_model.dart';
import 'package:address_book/views/details_page.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

class GroupView extends StatefulWidget {
  const GroupView({Key? key}) : super(key: key);

  @override
  _GroupViewState createState() => _GroupViewState();
}

class _GroupViewState extends State<GroupView> {
  bool isLoading = true;

  @override
  void initState() {
    context.read<ContactsViewModel>().getContacts().then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var contacts = context.select<ContactsViewModel, List<String>>(
        (viewModel) => viewModel.filteredContacts);
    return Center(
      child: isLoading
          ? CircularProgressIndicator()
          : contacts.length == 0
              ? Text('No Contacts Found!')
              : GroupedListView<String, String>(
                  elements: contacts,
                  groupBy: (contact) => contact.characters.first,
                  groupSeparatorBuilder: (String char) => Text(char),
                  itemBuilder: (context, dynamic contact) => Column(
                    children: [
                      ListTile(
                        title: Text(contact),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(name: contact),
                            )),
                      ),
                      Divider(height: 0, thickness: 1),
                    ],
                  ),
                  useStickyGroupSeparators: true,
                  order: GroupedListOrder.ASC,
                ),
    );
  }
}
