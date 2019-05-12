import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_hello/steam_post.dart';
import '.keys' as keys;

var url = new File('.keys').readAsString();

Future<UserGames> getPost() async{
  final response = await http.get('$url/1');
  return userGamesFromJson(response.body);
}
