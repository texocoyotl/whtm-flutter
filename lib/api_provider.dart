import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'models/team_model.dart';
import 'models/login_model.dart';
import 'api_exception.dart';

class ApiProvider {
  Client client = Client();
  final baseUrl = 'https://whtmapi.herokuapp.com/';

  void close(){
    client.close();
  }

  Future<List<TeamModel>> fetchTeams() async {
    final String url = baseUrl + "team-names";
    print("API Call: $url");
    final response = await client.get(url);
    print(response.body);
    List<dynamic> jsonResponse = json.decode(response.body) as List;

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return jsonResponse.map((e) => new TeamModel.fromJson(e)).toList();
    } else {
      // If that call was not successful, throw an error.
      throw ApiException('Connectivity Error');
    }
  }

  Future<LoginModel> authenticate(String teamId, String password) async {
    final String url = baseUrl + "authenticate";
    print("API Call: $url");
    final response = await client.post(url, body:{'team_id':teamId, 'password':password});
    print(response.body);
    Map<String, dynamic> jsonResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return LoginModel.fromJson(jsonResponse);
    } else {
      // If that call was not successful, throw an error.
      throw ApiException(jsonResponse['message']);
    }
  }
}