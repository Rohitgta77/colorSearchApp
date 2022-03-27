// To parse this JSON data, do
//
//     final colorModel = colorModelFromJson(jsonString);

import 'dart:convert';

List<ColorModel> colorModelFromJson(String str) =>
    List<ColorModel>.from(json.decode(str).map((x) => ColorModel.fromJson(x)));

String colorModelToJson(List<ColorModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ColorModel {
  ColorModel({
    this.id,
    this.title,
    this.userName,
    this.numViews,
    this.numVotes,
    this.numComments,
    this.numHearts,
    this.rank,
    this.dateCreated,
    this.hex,
    this.rgb,
    this.hsv,
    this.description,
    this.url,
    this.imageUrl,
    this.badgeUrl,
    this.apiUrl,
  });

  int? id;
  String? title;
  String? userName;
  int? numViews;
  int? numVotes;
  int? numComments;
  dynamic numHearts;
  int? rank;
  DateTime? dateCreated;
  String? hex;
  Rgb? rgb;
  Hsv? hsv;
  String? description;
  String? url;
  String? imageUrl;
  String? badgeUrl;
  String? apiUrl;

  factory ColorModel.fromJson(Map<String, dynamic> json) => ColorModel(
        id: json["id"],
        title: json["title"],
        userName: json["userName"],
        numViews: json["numViews"],
        numVotes: json["numVotes"],
        numComments: json["numComments"],
        numHearts: json["numHearts"],
        rank: json["rank"],
        dateCreated: json["dateCreated"] == null
            ? null
            : DateTime.parse(json["dateCreated"]),
        hex: json["hex"],
        rgb: json["rgb"] == null ? null : Rgb.fromJson(json["rgb"]),
        hsv: json["hsv"] == null ? null : Hsv.fromJson(json["hsv"]),
        description: json["description"],
        url: json["url"],
        imageUrl: json["imageUrl"],
        badgeUrl: json["badgeUrl"],
        apiUrl: json["apiUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "userName": userName,
        "numViews": numViews,
        "numVotes": numVotes,
        "numComments": numComments,
        "numHearts": numHearts,
        "rank": rank,
        "dateCreated":
            dateCreated == null ? null : dateCreated!.toIso8601String(),
        "hex": hex,
        "rgb": rgb == null ? null : rgb!.toJson(),
        "hsv": hsv == null ? null : hsv!.toJson(),
        "description": description,
        "url": url,
        "imageUrl": imageUrl,
        "badgeUrl": badgeUrl,
        "apiUrl": apiUrl,
      };
}

class Hsv {
  Hsv({
    this.hue,
    this.saturation,
    this.value,
  });

  int? hue;
  int? saturation;
  int? value;

  factory Hsv.fromJson(Map<String, dynamic> json) => Hsv(
        hue: json["hue"],
        saturation: json["saturation"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "hue": hue,
        "saturation": saturation,
        "value": value,
      };
}

class Rgb {
  Rgb({
    this.red,
    this.green,
    this.blue,
  });

  int? red;
  int? green;
  int? blue;

  factory Rgb.fromJson(Map<String, dynamic> json) => Rgb(
        red: json["red"],
        green: json["green"],
        blue: json["blue"],
      );

  Map<String, dynamic> toJson() => {
        "red": red,
        "green": green,
        "blue": blue,
      };
}
