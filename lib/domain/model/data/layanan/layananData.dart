// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'bankSampahData.dart';
import 'pickupData.dart';

class LayananData {
  // ketika saya panggil data bank_sampah bisa ke get
  List<BankSampahData> bank_sampah;
  // tapi pas saya panggil pick_up tidak ke get di screen padahal struktur sama
  List<PickUpData> pick_up;
  LayananData(
    this.bank_sampah,
    this.pick_up,
  );
}
