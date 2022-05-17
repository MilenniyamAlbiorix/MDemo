import 'package:dio/dio.dart';

import 'Resultrespnse.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'https://opentdb.com/api.php?amount=5&difficulty=medium&type=multiple&category=11';

// TODO: Add methods
  Future<NewResponse> getUser() async {
    // Perform GET request to the endpoint "/users/<id>"
    Response response = await _dio.get('https://opentdb.com/api.php?amount=5&difficulty=medium&type=multiple&category=11');

    // Prints the raw data returned by the server
    print('User Info: ${response.data}');

    // Parsing the raw JSON data to the User class
    NewResponse user = NewResponse.fromJson(response.data);

    return user;
  }
}
