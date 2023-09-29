import 'dart:convert';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/bank_sampah/bank_sampah_response.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';
import 'package:loginandsignup/data/service/remote/bank_sampah/bank_sampah_remote_service.dart';
import 'package:loginandsignup/domain/model/data/bank_sampah/bank_sampah_data.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/repository/bank_sampah/bank_sampah_repository.dart';

class BankSampahRepositoryImpl implements BankSampahRepository {
  final bankSampahService = BankSampahRemoteService();

  @override
  Future<ResultEntity<List<BankSampahData>>> fecthBankSampah(
      AuthenticationHeaderRequest header) async {
    // TODO: implement fecthBankSampah
    try {
      final response = await bankSampahService.fetchBankSampah(header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse<List<BankSampahResponse>> baseResponseArray =
            BaseRemoteResponse<List<BankSampahResponse>>.fromJson(
                jsonDecode(response.body),
                (json) => (json as List)
                    .map((e) =>
                        BankSampahResponse.fromJson(e as Map<String, dynamic>))
                    .toList());
        if (baseResponseArray.status == null) {
          return ResultError(message: "Status Null");
        } else if (baseResponseArray.status!.code != 0) {
          return ResultError(message: "Status Code Not Null");
        } else {
          return ResultSuccess(baseResponseArray.data!
              .map((e) => e.toBankSampahData())
              .toList());
        }
      } else {
        return ResultError(message: "");
      }
    } catch (e) {
      print(e.toString());
      return ResultError(message: e.toString());
    }
  }
}
