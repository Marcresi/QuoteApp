import 'package:flutter/foundation.dart';

import '../models/apimodel2.dart';
import 'package:http/http.dart' as http;

class authorService with ChangeNotifier{
  Future<AuthorSearch?> getQuotes2() async{
    var client=http.Client();

    var uri2=Uri.parse('https://api.quotable.io/search/authors?query=Einstein');


    var response2=await client.get(uri2);

    if(response2.statusCode== 200){
      var json=response2.body;
      return authorSearchFromJson(json);
    }
  }


  notifyListeners();
}