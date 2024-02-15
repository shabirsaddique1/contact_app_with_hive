import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 0)
class Contact extends HiveObject {
  @HiveField(0)
  String firstName;

  @HiveField(1)
  String lastName;

  @HiveField(2)
  String phoneNumber;

  @HiveField(3)
  String nickname;

  @HiveField(4)
  String email;

  @HiveField(5)
  List<String> groups;

  @HiveField(6)
  String notes;

  @HiveField(7)
  String relationship;

  Contact({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.nickname,
    required this.email,
    required this.groups,
    required this.notes,
    required this.relationship,
  });
}
