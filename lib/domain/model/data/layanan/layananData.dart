// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'bankSampahData.dart';
import 'pickupData.dart';

class LayananData {
  List<BankSampahData> bank_sampah;
  List<PickUpData> pick_up;
  LayananData(
    this.bank_sampah,
    this.pick_up,
  );
}
