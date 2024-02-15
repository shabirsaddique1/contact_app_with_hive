import 'package:contact_app/widgets/app_toast.dart';
import 'package:flutter/material.dart';

class AddContactBottomSheet extends StatelessWidget {
  AddContactBottomSheet({required this.viewModel, this.isEdit = false});
  var viewModel;
  var isEdit = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: viewModel.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: viewModel.contactService.firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the first name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: viewModel.contactService.lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the last name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: viewModel.contactService.phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the phone number';
                }
                return null;
              },
            ),
            TextFormField(
              controller: viewModel.contactService.nicknameController,
              decoration: InputDecoration(labelText: 'Nickname'),
            ),
            TextFormField(
              controller: viewModel.contactService.emailController,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value!.isNotEmpty && !value.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            TextFormField(
              controller: viewModel.contactService.groupsController,
              decoration: InputDecoration(labelText: 'Groups'),
            ),
            TextFormField(
              controller: viewModel.contactService.notesController,
              decoration: InputDecoration(labelText: 'Notes'),
            ),
            TextFormField(
              controller: viewModel.contactService.relationshipController,
              decoration: InputDecoration(labelText: 'Relationship'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (viewModel.formKey.currentState!.validate()) {
                  viewModel.formKey.currentState!.save();
                  if (isEdit) {
                    await viewModel.editContact();
                    customAppToast(title: "Contact updated!");
                  } else {
                    await viewModel.saveContact();
                    customAppToast(title: "Contact Added!");
                  }
                  Navigator.pop(context);
                }
              },
              child: isEdit ? Text('Edit Contact') : Text('Save Contact'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueAccent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
