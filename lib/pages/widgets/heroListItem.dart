import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../heroItemPage.dart';

Widget ImageHeroItem(image, context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.45,
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0, 5.0), //(x,y)
          blurRadius: 6.0,
        ),
      ],
      image: DecorationImage(
          alignment: Alignment(0, 0),
          image: NetworkImage(image),
          fit: BoxFit.cover),
    ),
  );
}

Widget CharacteristicHeroItem(nickname, stats, bool isCol, context) {
  return Container(
      child: Flex(
    direction: Axis.vertical,
    crossAxisAlignment:
        isCol ? CrossAxisAlignment.start : CrossAxisAlignment.center,
    children: <Widget>[
      isCol
          ? Container(
              child: Text(nickname,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center),
            )
          : Container(
              child: Text(nickname,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center),
            ),
      SizedBox(
        height: isCol ? 45 : 20,
      ),
      Container(
        child: Flex(
          direction: isCol ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Ink(
                    width: 35,
                    height: 35,
                    decoration: const ShapeDecoration(
                      color: Colors.lightBlue,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(MaterialCommunityIcons.brain),
                      color: Colors.white,
                      onPressed: () {},
                      iconSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(isCol
                      ? 'Intelligence: ' + stats['intelligence'].toString()
                      : '' + stats['intelligence'].toString()),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Ink(
                    width: 35,
                    height: 35,
                    decoration: const ShapeDecoration(
                      color: Colors.redAccent,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(FontAwesome.hand_rock_o),
                      color: Colors.white,
                      iconSize: 20,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(isCol
                      ? 'Strength: ' + stats['strength'].toString()
                      : '' + stats['strength'].toString()),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Ink(
                    width: 35,
                    height: 35,
                    decoration: const ShapeDecoration(
                      color: Colors.greenAccent,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(MaterialCommunityIcons.weather_windy),
                      color: Colors.white,
                      onPressed: () {},
                      iconSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(isCol
                      ? 'Agility: ' + stats['speed'].toString()
                      : '' + stats['speed'].toString()),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ],
  ));
}

Widget HeroListItem(data, context) {
  return GestureDetector(
    child: Container(
        height: 300,
        child: Stack(children: [
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .45,
                  ),
                  CharacteristicHeroItem(
                      data.nickname, data.powerstats, true, context)
                ],
              ),
            ),
          ),
          ImageHeroItem(data.url, context)
        ])),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HeroItemPage(data: data)),
      );
    },
  );
}
