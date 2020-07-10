import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:superhero/domain/heroData.dart';

import 'widgets/heroListItem.dart';

class HeroList extends StatefulWidget {
  HeroList({Key key}) : super(key: key);

  @override
  _HeroListState createState() => _HeroListState();
}

class _HeroListState extends State<HeroList> {
  List<HeroData> listHero = [];

  int currentLength = 0;
  int increment = 3;
  bool isLoading = false;
  String find = '';

  final myController = TextEditingController();

  @override
  void initState() {
    _loadData(find);
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2)),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).backgroundColor,
                ),
                fillColor: Colors.white,
                filled: true),
            onChanged: (text) {
              setState(() {
                find = text;
              });
              _loadData(find);
            },
          ),
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        ),
        Container(
          height: 450,
          child: LazyLoadScrollView(
              isLoading: isLoading,
              onEndOfPage: () => _loadData(find),
              child: ListView.builder(
                  itemCount: listHero.length,
                  itemBuilder: (context, i) {
                    if (isLoading && i == listHero.length)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    else
                      return HeroListItem(listHero[i], context);
                  })),
        ),
      ],
    );
  }

  _loadData(text) async {
    print(text != '');
    setState(() {
      isLoading = true;

      find = text;
    });
    var heroDataList = List<HeroData>();
    if (text != '') {
      final response = await http.get(
          'https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/all.json');
      if (response.statusCode == 200) {
        var data = (json.decode(response.body) as List);
        data.forEach((value) {
          if (value['name'].toLowerCase().contains(text.toLowerCase()) ==
              true) {
            var record = HeroData(
                id: value['id'],
                nickname: value['name'],
                url: value['images']['sm'],
                powerstats: value['powerstats'],
                appearance: value['appearance'],
                biography: value['biography']);
            heroDataList.add(record);
          }
        });
      }
    } else {
      for (var i = currentLength; i <= currentLength + increment; i++) {
        final response = await http.get(
            'https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/id/${i + 1}.json');
        if (response.statusCode == 200) {
          var data = (json.decode(response.body) as Map);
          var record = HeroData(
              id: data['id'],
              nickname: data['name'],
              url: data['images']['sm'],
              powerstats: data['powerstats'],
              appearance: data['appearance'],
              biography: data['biography']);
          heroDataList.add(record);
        }
      }
    }
    setState(() {
      if (text != '') {
        listHero = heroDataList;

        currentLength = 0;
      } else {
        listHero = new List.from(listHero)..addAll(heroDataList);

        currentLength = listHero.length;
      }
      isLoading = false;
    });
  }
}
