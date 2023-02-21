import 'package:http/http.dart';

class LoginRemoteService {
  Client client = Client();
  final apiKey = "";

  Future<Response> fetchData(String country) async {
    Map<String, dynamic> queries = {};
    queries['apiKey'] = apiKey;
    queries['country'] = country;

    final url = Uri.https("newsapi.org", "/v2/top-headLines", queries);
    print("URL : ${url.toString()}");
    return client.post(url);
  }
}
