import 'package:contact_app/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import '../services/contact_services.dart';

class HomeViewModel extends BaseViewModel {
  final contactService = locator<ContactServices>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var searchText = "";

  List<Contact> contactList = [];

  getAllContacts() {
    return contactService.getAllContacts();
  }

  saveContact() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Contact contact = Contact(
        firstName: contactService.firstNameController.text,
        lastName: contactService.lastNameController.text,
        phoneNumber: contactService.phoneNumberController.text,
        nickname: contactService.nicknameController.text,
        email: contactService.emailController.text,
        groups: contactService.groupsController.text.split(','),
        notes: contactService.notesController.text,
        relationship: contactService.relationshipController.text,
      );
      await contactService.saveContact(contact);
      rebuildUi();
      contactService.resetDataFields();
    }
  }

  updateSearchText(String value) {
    searchText = value;
    rebuildUi();
  }

  search(String firstname, String lastName) {
    return (searchText == "") ||
        ('$firstname $lastName'
            .toLowerCase()
            .contains(searchText.toLowerCase()));
  }
}
