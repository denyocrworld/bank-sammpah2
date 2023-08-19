import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/data/bank_sampah/bank_sampah_data.dart';

abstract class BankSampahRepository {
  Future<ResultEntity<List<BankSampahData>>> fecthBankSampah(
      AuthenticationHeaderRequest header);
}
