import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:phoneplanet/api/exceptions/api_exception.dart';
import 'package:phoneplanet/api/service/service.dart';
import 'package:http/http.dart' as http;

class MainService implements IService {
  final String baseUrl = dotenv.env['BASE_URL']!;
  final http.Client client = http.Client();

  static Map<String, String> defaultHeaders = {
    'Authorization': '',
  };

  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? headers,
  }) async {
    log('GET ::: $baseUrl$path');
    log('HEADERS ::: ${headers ?? defaultHeaders}');
    Uri uri = Uri.parse('$baseUrl$path');
    http.Response response = await http.get(uri, headers: headers ?? defaultHeaders);
    return _validateResponse(response);
  }

  @override
  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    log('POST ::: $baseUrl$path');
    log('HEADERS ::: ${headers ?? defaultHeaders}');
    log('BODY ::: $body');
    Uri uri = Uri.parse('$baseUrl$path');
    http.Response response = await http.post(uri, headers: headers ?? defaultHeaders, body: body);
    return _validateResponse(response);
  }

  @override
  Future<Map<String, dynamic>> put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    log('PUT ::: $baseUrl$path');
    log('HEADERS ::: ${headers ?? defaultHeaders}');
    log('BODY ::: $body');
    Uri uri = Uri.parse('$baseUrl$path');
    http.Response response = await http.put(uri, headers: headers ?? defaultHeaders, body: body);
    return _validateResponse(response);
  }

  @override
  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    log('DELETE ::: $baseUrl$path');
    log('HEADERS ::: ${headers ?? defaultHeaders}');
    log('BODY ::: $body');
    Uri uri = Uri.parse('$baseUrl$path');
    http.Response response = await http.delete(uri, headers: headers ?? defaultHeaders, body: body);
    return _validateResponse(response);
  }

  Map<String, dynamic> _validateResponse(http.Response response) {
    log('STATUS CODE ::: ${response.statusCode}');
    log('RESPONSE ::: ${response.body}');

    Map<String, dynamic> responseBody = jsonDecode(response.body);
    if (response.statusCode > 299) {
      throw ApiException(statusCode: response.statusCode, message: responseBody['message']);
    }
    return responseBody;
  }
}
