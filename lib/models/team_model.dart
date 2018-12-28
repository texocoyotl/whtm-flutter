class TeamModel{
  String id;
  String name;

  TeamModel.fromJson(Map<String, dynamic> parsedJson){
    this.id = parsedJson["_id"];
    this.name = parsedJson["name"];
  }
}