
class FactionModel{
  String id;
  String name;

  FactionModel.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
  }
}