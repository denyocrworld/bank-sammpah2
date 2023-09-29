// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:io';

class ProfileRequest {
  File? image;
  String name;
  String email;
  String phone_number;
  String address;
  ProfileRequest(
    this.image,
    this.name,
    this.email,
    this.phone_number,
    this.address,
  );
}
