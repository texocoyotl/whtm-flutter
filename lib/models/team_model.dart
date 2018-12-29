class TeamModel{
  String id;
  String name;
  List<PlayerModel> players;

  TeamModel.fromJson(Map<String, dynamic> json){
    this.id = json["_id"];
    this.name = json["name"];
    if (json.containsKey('players')){
      this.players = (json['players'] as List).map((e) => PlayerModel.fromJson(e)).toList();
    }
  }
}

class PlayerModel{
  String id;
  String name;

  PlayerModel.fromJson(Map<String, dynamic> json){
    this.id = json['_id'];
    this.name = json['name'];
  }
}