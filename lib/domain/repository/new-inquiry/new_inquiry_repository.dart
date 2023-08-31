import '../../../data/base/result_entity.dart';
import '../../base/authentication_header_request.dart';
import '../../model/request/new-inquiry/new_inquiry_request.dart';

abstract class NewInquiryRepository {
  Future<ResultEntity> addQuiry(
      NewInquiryRequest request, AuthenticationHeaderRequest header);
}
