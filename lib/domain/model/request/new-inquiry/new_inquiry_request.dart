// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:io';

class NewInquiryRequest {
  int weight;
  String pick_up;
  File? image;
  String pick_up_time;
  NewInquiryRequest(
    this.weight,
    this.pick_up,
    this.image,
    this.pick_up_time,
  );
}
