import 'dart:convert';
import 'package:contactcars_app_retail/db/api/url_provider.dart';
import 'package:crypto/crypto.dart';

String? encryptImageParams(String input) {
  try {
    var key = UrlProvider.config.apiKey;
    var keyBytes = utf8.encode(key);
    var messageBytes = utf8.encode(input);

    var hmacSha512 = Hmac(sha512, keyBytes);
    var digest = hmacSha512.convert(messageBytes);

    return base64.encode(digest.bytes).replaceAll('\n', '');
  } catch (e) {
    return null;
  }
}

String? encryptFawryToSHA512(String input) {
  try {
    var key = UrlProvider.config.apiKey;
    var keyBytes = utf8.encode(key);
    var messageBytes = utf8.encode(input);

    var hmacSha512 = Hmac(sha512, keyBytes);
    var digest = hmacSha512.convert(messageBytes);

    return base64.encode(digest.bytes).replaceAll('\n', '');
  } catch (e) {
    return null;
  }
}

String? encryptPaymobToSHA512(String input) {
  try {
    var key = UrlProvider.config.apiKey;
    var keyBytes = utf8.encode(key);
    var messageBytes = utf8.encode(input);

    var hmacSha512 = Hmac(sha512, keyBytes);
    var digest = hmacSha512.convert(messageBytes);

    return base64.encode(digest.bytes).replaceAll('\n', '');
  } catch (e) {
    return null;
  }
}
