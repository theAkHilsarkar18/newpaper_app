
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:newpaper_app/homescreen/model/hoemodel.dart';

class Homeprovider extends ChangeNotifier
{
  Map<dynamic,dynamic> newsJsonMapList = {};

  List<Articles> newsJsonList = [];

  Future<void> jsonParshingOfNewsdata()
  async {
    String newsDataJsonInString = await rootBundle.loadString("assets/json/news.json");
    var newsDataInJson = jsonDecode(newsDataJsonInString);
    Homemodel homemodel = Homemodel().jsonDataFromHomemodel(newsDataInJson);
    var articleList = newsDataInJson['articles'] as List;
    newsJsonList = articleList.map((e)=>Articles().jsonDataFromArticles(e)).toList();
    newsJsonMapList = newsDataInJson;
    notifyListeners();
  }

 

}