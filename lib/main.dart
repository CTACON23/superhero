import 'package:flutter/material.dart';
import 'package:superhero/pages/heroList.dart';

void main() => runApp(SuperheroApp());

class SuperheroApp extends StatelessWidget {
  const SuperheroApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Superhero App',
      home: HomePage(),
      theme: ThemeData(backgroundColor: Color.fromRGBO(122, 50, 166, 1)),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('SUPER HERO')),
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
        ),
        body: HeroList());
  }
}
