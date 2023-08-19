// ignore_for_file: public_member_api_docs, sort_constructors_first
class TokenHeaderRequest {
  String accesToken;
  String email;
  TokenHeaderRequest(
    this.accesToken,
    this.email
  );

  Map<String, String> toHeader() {
    return <String, String>{
      'Cookie': 'email=$email;token=$accesToken' ,
    };
  }
}
