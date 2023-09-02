import 'package:jwt_decoder/jwt_decoder.dart';
import 'commons.dart';

checkAuthentication() async {
  final token = await Commons().getUid();

  if (validationToken(token)) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode('$token');

    int timestampInSeconds = decodedToken["exp"];
    int timestampInMilliseconds = timestampInSeconds * 1000;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
      timestampInMilliseconds,
    );
    if (validationExp(dateTime)) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

logout() async {
  await Commons().removeUid();
}

validationToken(token) {
  if (token != null && token != '') {
    return true;
  } else {
    return false;
  }
}

validationExp(dateTime) {
  if (dateTime.isAfter(DateTime.now())) {
    return true;
  } else {
    return false;
  }
}
