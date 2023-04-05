// ignore_for_file: public_member_api_docs, sort_constructors_first
class TokenHeaderRequest {
  Future<String> token;
  TokenHeaderRequest({
    required this.token,
  });

  Map<String, Future<String>> toHeader() {
    return <String, Future<String>>{
      'Authentikasi': token,
    };
  }
}
