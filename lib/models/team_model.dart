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
  List<ArmyModel> armies;

  PlayerModel.fromJson(Map<String, dynamic> json){
    this.id = json['_id'];
    this.name = json['name'];
    if (json.containsKey('armies')){
      this.armies = (json['armies'] as List).map((e) => ArmyModel.fromJson(e)).toList();
    }
  }
}

class ArmyModel {
  String id;
  String name;
  String factionId;
  String buildUrl;

  ArmyModel.fromJson(Map<String, dynamic> json){
    this.id = json['_id'];
    this.name = json['name'];
    this.factionId = json['faction'];
    this.buildUrl = json['build_url'];
  }
}

