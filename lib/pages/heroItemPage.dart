import 'package:flutter/material.dart';
import 'package:superhero/domain/heroData.dart';

import 'widgets/heroListItem.dart';

class HeroItemPage extends StatelessWidget {
  final HeroData data;
  const HeroItemPage({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: <Widget>[
          Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 5.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                  image: DecorationImage(
                      alignment: Alignment(0, 0),
                      image: NetworkImage(data.url),
                      fit: BoxFit.cover),
                ),
              )),
          Expanded(
            flex: 6,
            child: Container(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                            text: 'NAME: ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: data.nickname,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal))
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CharacteristicHeroItem(
                        'Powerstats', data.powerstats, false, context),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Apperance',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    TextValuePare('Gender: ', data.appearance['gender']),
                    TextValuePare('Race: ', data.appearance['race']),
                    TextValuePare('Height: ', data.appearance['height'][1]),
                    TextValuePare('Weight: ', data.appearance['weight'][1]),
                    TextValuePare('Eye Color: ', data.appearance['eyeColor']),
                    TextValuePare('Hair Color: ', data.appearance['hairColor']),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Biography',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    TextValuePare('Full name: ', data.biography['fullName']),
                    TextValuePare('Alter ego: ', data.biography['alterEgos']),
                    TextValuePare(
                        'Place of birth: ', data.biography['placeOfBirth']),
                    TextValuePare('First Appearance: ',
                        data.biography['firstAppearance']),
                    TextValuePare('Publisher: ', data.biography['publisher']),
                    TextValuePare('Alignment: ', data.biography['alignment']),
                  ],
                )),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        backgroundColor: Theme.of(context).backgroundColor,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

Widget TextValuePare(name, value) {
  return RichText(
    text: TextSpan(
        text: name,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        children: <TextSpan>[
          TextSpan(
              text: value,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal))
        ]),
  );
}
