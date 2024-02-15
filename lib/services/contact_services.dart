import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../models/contact.dart';

class ContactServices extends ContactValidation {
  Future<Box<Contact>> _getContactBox() async {
    return Hive.openBox<Contact>('contacts');
  }

  Future<void> saveContact(Contact contact) async {
    final box = await _getContactBox();
    await box.add(contact);
  }

  Future<List<Contact>> getAllContacts() async {
    final box = await _getContactBox();
    return box.values.toList();
  }

  Future<void> updateContact(Contact contact) async {
    final box = await _getContactBox();
    await box.put(contact.key, contact);
  }

  Future<void> deleteContact(Contact contact) async {
    final box = await _getContactBox();
    await box.delete(contact.key);
  }
}

class ContactValidation {
  Contact? selectedContact;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController groupsController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController relationshipController = TextEditingController();

  void resetDataFields() {
    firstNameController.text = '';
    lastNameController.text = '';
    phoneNumberController.text = '';
    nicknameController.text = '';
    emailController.text = '';
    groupsController.text = '';
    notesController.text = '';
    relationshipController.text = '';
  }

  setDataFields() {
    firstNameController.text = selectedContact!.firstName;
    lastNameController.text = selectedContact!.lastName;
    phoneNumberController.text = selectedContact!.phoneNumber;
    nicknameController.text = selectedContact!.nickname;
    emailController.text = selectedContact!.email;
    groupsController.text = selectedContact!.groups.join(', ');
    notesController.text = selectedContact!.notes;
    relationshipController.text = selectedContact!.relationship;
  }
}
