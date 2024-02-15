import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../models/contact.dart';
import '../models/home_view_model.dart';
import 'add_contact_sheet.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, viewModel, widget) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,
              title: Text(
                "Contact App",
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: SingleChildScrollView(
                          child: AddContactBottomSheet(viewModel: viewModel)),
                    );
                  },
                );
              },
            ),
            body: FutureBuilder<List<Contact>>(
                future: viewModel.getAllContacts(),
                builder: (context, contacts) {
                  if (contacts.hasData) {
                    viewModel.contactList = contacts.data!;
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                            ),
                            onChanged: (value) {
                              viewModel.updateSearchText(value);
                            },
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: contacts.data!.length,
                              itemBuilder: (context, index) {
                                return viewModel.search(
                                        contacts.data![index].firstName,
                                        contacts.data![index].lastName)
                                    ? ListTile(
                                        onTap: () {
                                          viewModel.contactService
                                                  .selectedContact =
                                              contacts.data![index];
                                          context.go(
                                            '/contact_detail',
                                          );
                                        },
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                                '${contacts.data![index].firstName}'),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                                '${contacts.data![index].lastName}'),
                                          ],
                                        ),
                                        subtitle: Text(
                                            '${contacts.data![index].phoneNumber}'),
                                      )
                                    : SizedBox.shrink();
                              }),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          );
        });
  }
}
