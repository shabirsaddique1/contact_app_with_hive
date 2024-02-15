import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../models/contact.dart';
import '../models/contact_detail_view_model.dart';
import 'add_contact_sheet.dart';

class ContactDetailView extends StatelessWidget {
  ContactDetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ContactDetailViewModel(),
        builder: (context, viewModel, widget) {
          Contact contact = viewModel.contactService.selectedContact!;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,
              title: Text(
                "Contact Detail",
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${contact.firstName} ${contact.lastName}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Phone Number: ${contact.phoneNumber}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nickname: ${contact.nickname}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Email: ${contact.email}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Groups: ${contact.groups.join(", ")}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Notes: ${contact.notes}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Relationship: ${contact.relationship}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            viewModel.contactService.setDataFields();
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: SingleChildScrollView(
                                      child: AddContactBottomSheet(
                                    viewModel: viewModel,
                                    isEdit: true,
                                  )),
                                );
                              },
                            );
                          },
                          child: Text("Edit")),
                      ElevatedButton(
                        onPressed: () async {
                          await viewModel.deleteContact();
                          Navigator.of(context).pop();
                        },
                        child: Text("Delete"),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
