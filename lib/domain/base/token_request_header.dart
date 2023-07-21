// ignore_for_file: public_member_api_docs, sort_constructors_first
class TokenHeaderRequest {
  Future<String> accesToken;
  TokenHeaderRequest({
    required this.accesToken,
  });

  Map<String, String> toHeader() {
    return <String, String>{
      'Cookie': 'token=$accesToken',
    };
  }
}
