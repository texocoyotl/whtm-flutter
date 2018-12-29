import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'models/team_model.dart';
import 'models/login_model.dart';
import 'models/faction_model.dart';
import 'api_exception.dart';

class ApiProvider {
  Client client = Client();
  final baseUrl = 'https://whtmapi.herokuapp.com/';
  final defaultApiExceptionMessage = 'Could not load factions, please check your network connection.';

  void close(){
    client.close();
  }

  Future<List<TeamModel>> fetchTeams() async {
    final String url = baseUrl + "team-names";
    print("API Call: $url");
    final response = await client.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<dynamic> jsonResponse = json.decode(response.body) as List;
      return jsonResponse.map((e) => new TeamModel.fromJson(e)).toList();
    } else {
      // If that call was not successful, throw an error.
      throw ApiException(defaultApiExceptionMessage);
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

  Future<List<FactionModel>> fetchFactions(String token) async {
    final String url = baseUrl + "factions";
    print("API Call: $url");
    final response = await client.get(url, headers: {'x-access-token': token});
    print(response.body);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<dynamic> jsonResponse = json.decode(response.body) as List;
      return jsonResponse.map((e) => new FactionModel.fromJson(e)).toList();
    } else {
      // If that call was not successful, throw an error.
      throw ApiException(defaultApiExceptionMessage);
    }
  }

  Future<List<FactionModel>> fetchTeam(String token, String teamId) async {
    final String url = baseUrl + 'team/$teamId';
    print('API Call: $url');
    final response = await client.get(url, headers: {'x-access-token': token});
    print(response.body);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<dynamic> jsonResponse = json.decode(response.body) as List;
      return jsonResponse.map((e) => new FactionModel.fromJson(e)).toList();
    } else {
      // If that call was not successful, throw an error.
      throw ApiException(defaultApiExceptionMessage);
    }
  }
}