import 'package:flutter/foundation.dart';

import '../models/apimodel.dart';
import 'package:http/http.dart' as http;

class searchService with ChangeNotifier{
  Future<Search?> getQuotes() async{
    var client=http.Client();

    var uri1=Uri.parse('https://api.quotable.io/search/quotes?query=love&limit=10');


    var response=await client.get(uri1);

    if(response.statusCode== 200){
      var json=response.body;
      return searchFromJson(json);
    }
  }

Future<Search?> getQuotes3() async{
    var client=http.Client();

    var uri2=Uri.parse('https://api.quotable.io/search/authors?query=Einstein');
    var uri3=Uri.parse('https://api.quotable.io/search/quotes?query=life%20happiness');

 
    var response2=await client.get(uri2);
    var response3=await client.get(uri3);

     if(response3.statusCode== 200){
      var json3=response3.body;
      return searchFromJson(json3);
    }
  }
  notifyListeners();
}