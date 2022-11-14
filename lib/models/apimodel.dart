// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
    Search({
        required this.count,
        required this.totalCount,
        required this.page,
        required this.totalPages,
        required this.lastItemIndex,
        required this.results,
    });

    int count;
    int totalCount;
    int page;
    int totalPages;
    int lastItemIndex;
    List<Result> results;

    factory Search.fromJson(Map<String, dynamic> json) => Search(
        count: json["count"],
        totalCount: json["totalCount"],
        page: json["page"],
        totalPages: json["totalPages"],
        lastItemIndex: json["lastItemIndex"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "totalCount": totalCount,
        "page": page,
        "totalPages": totalPages,
        "lastItemIndex": lastItemIndex,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };

  void getData() {}
}

class Result {
    Result({
        required this.id,
        required this.content,
        required this.author,
        required this.tags,
        required this.authorId,
        required this.authorSlug,
        required this.length,
        required this.dateAdded,
        required this.dateModified,
    });

    String id;
    String content;
    String author;
    List<String> tags;
    String authorId;
    String authorSlug;
    int length;
    DateTime dateAdded;
    DateTime dateModified;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        content: json["content"],
        author: json["author"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        authorId: json["authorId"],
        authorSlug: json["authorSlug"],
        length: json["length"],
        dateAdded: DateTime.parse(json["dateAdded"]),
        dateModified: DateTime.parse(json["dateModified"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "content": content,
        "author": author,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "authorId": authorId,
        "authorSlug": authorSlug,
        "length": length,
        "dateAdded": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "dateModified": "${dateModified.year.toString().padLeft(4, '0')}-${dateModified.month.toString().padLeft(2, '0')}-${dateModified.day.toString().padLeft(2, '0')}",
    };
}
