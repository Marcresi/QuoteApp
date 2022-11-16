import 'package:flutter/material.dart';
import 'package:quoteApp/main.dart';
import 'package:quoteApp/providers/authorService.dart';
import 'package:quoteApp/providers/favouriteAdd.dart';
import '../models/apimodel2.dart';
import 'package:provider/provider.dart';

class Author extends StatefulWidget {
  const Author({Key? key}) : super(key: key);

  @override
  State<Author> createState() => _AuthorState();
}

List<String> authorName = [];

class _AuthorState extends State<Author> {
  AuthorSearch? quotes2;

  var isLoaded = false;

  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    quotes2 = (await context.read<authorService>().getQuotes2())!;
    if (quotes2 != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Quotes"));
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(
              color: Colors.black,
              height: 20,
              thickness: 0.2,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              height: 86.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3.0,
                        blurRadius: 5.0)
                  ],
                  color: Colors.white),
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: CustomSearchDelegate(),
                        );
                      },
                      icon: Icon(Icons.search),
                    ),
                    hintText: '   Search for authors   '),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: quotes2!.results.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    margin: EdgeInsets.only(
                        top: 0.0, bottom: 25.0, left: 25.0, right: 25.0),
                    padding: EdgeInsets.only(
                        top: 16.0, bottom: 5.0, left: 5.0, right: 5.0),
                    width: 377.0,
                    decoration: BoxDecoration(
                      color: MyApp.accentColor,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1.0,
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        'Author : ${quotes2!.results[index].name}',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      subtitle: Text(
                        'Quotes : ${quotes2!.results[index].bio}',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.add,
                        ),
                        iconSize: 43.0,
                        color: Theme.of(context).errorColor,
                        onPressed: () => context
                            .read<favouriteAdd>()
                            .favAdd(quotes2!.results[index].name),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate with ChangeNotifier {
  List<String> searchTerms = ["Albert", "Einstein", "George Sand", "Olivier Wendell"];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = '';
          FocusManager.instance.primaryFocus?.unfocus();
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implemet buildResults
    List<String> matchQuery = [];
    for (var tution in searchTerms ) {
      if (tution.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(tution);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> matchQuery = [];
    for (var tution in searchTerms) {
      if (tution.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(tution);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
