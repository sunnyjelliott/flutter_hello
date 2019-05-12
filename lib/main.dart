import 'package:flutter/material.dart';
import 'post_getter.dart';
import 'package:flutter_hello/steam_post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Home()
    );
  }
}

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<UserGames>(
          future: getPost(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return ErrorWidget();
              }
              List<int> gameIds = [];
              snapshot.data.response.forEach((game) => gameIds.add(game.appid));
              return Text(gameIds.toString());
            }
            else
              return CircularProgressIndicator();
          }
      )
    );
  }
}