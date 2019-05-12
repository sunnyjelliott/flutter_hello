// To parse this JSON data, do
//
//     final userGames = userGamesFromJson(jsonString);

import 'dart:convert';

UserGames userGamesFromJson(String str) => UserGames.fromJson(json.decode(str));

String userGamesToJson(UserGames data) => json.encode(data.toJson());

class UserGames {
  Response response;

  UserGames({
    this.response,
  });

  factory UserGames.fromJson(Map<String, dynamic> json) => new UserGames(
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "response": response.toJson(),
  };
}

class Response {
  int gameCount;
  List<Game> games;

  Response({
    this.gameCount,
    this.games,
  });

  factory Response.fromJson(Map<String, dynamic> json) => new Response(
    gameCount: json["game_count"],
    games: new List<Game>.from(json["games"].map((x) => Game.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "game_count": gameCount,
    "games": new List<dynamic>.from(games.map((x) => x.toJson())),
  };
}

class Game {
  int appid;
  int playtimeForever;
  int playtime2Weeks;

  Game({
    this.appid,
    this.playtimeForever,
    this.playtime2Weeks,
  });

  factory Game.fromJson(Map<String, dynamic> json) => new Game(
    appid: json["appid"],
    playtimeForever: json["playtime_forever"],
    playtime2Weeks: json["playtime_2weeks"] == null ? null : json["playtime_2weeks"],
  );

  Map<String, dynamic> toJson() => {
    "appid": appid,
    "playtime_forever": playtimeForever,
    "playtime_2weeks": playtime2Weeks == null ? null : playtime2Weeks,
  };
}
