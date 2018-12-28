

class LoginModel{
  bool wasSuccessful;
  String message;
  String token;

  LoginModel.fromJson(Map<String, dynamic> json){
    wasSuccessful = json['success'];
    message = json['message'];
    token = json.containsKey('token') ? json['token'] : null;
  }

}