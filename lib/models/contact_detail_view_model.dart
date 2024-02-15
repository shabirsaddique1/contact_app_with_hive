import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import '../services/contact_services.dart';
import '../widgets/app_toast.dart';

class ContactDetailViewModel extends BaseViewModel {
  final contactService = locator<ContactServices>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  deleteContact() async {
    await contactService.deleteContact(contactService.selectedContact!);
    customAppToast(title: "Contact Deleted");
    rebuildUi();
  }

  editContact() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      contactService.selectedContact!.firstName =
          contactService.firstNameController.text;
      contactService.selectedContact!.lastName =
          contactService.lastNameController.text;
      contactService.selectedContact!.phoneNumber =
          contactService.phoneNumberController.text;
      contactService.selectedContact!.nickname =
          contactService.nicknameController.text;
      contactService.selectedContact!.email =
          contactService.emailController.text;
      contactService.selectedContact!.groups =
          contactService.groupsController.text.split(',');
      contactService.selectedContact!.notes =
          contactService.notesController.text;
      contactService.selectedContact!.relationship =
          contactService.relationshipController.text;
      await contactService.updateContact(contactService.selectedContact!);
      rebuildUi();
      contactService.resetDataFields();
    }
  }
}
