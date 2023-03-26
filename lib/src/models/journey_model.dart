// Typical model for json map to use in app

import 'dart:convert';

JourneyModel journeyModelFromJson(String str) =>
    JourneyModel.fromJson(json.decode(str));

String journeyModelToJson(JourneyModel data) => json.encode(data.toJson());

class JourneyModel {
  JourneyModel({
    required this.version,
    required this.systemMessages,
    required this.locations,
  });

  String version;
  List<SystemMessage> systemMessages;
  List<Location> locations;

  factory JourneyModel.fromJson(Map<String, dynamic> json) => JourneyModel(
        version: json["version"],
        systemMessages: List<SystemMessage>.from(
            json["systemMessages"].map((x) => SystemMessage.fromJson(x))),
        locations: List<Location>.from(
            json["locations"].map((x) => Location.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "systemMessages":
            List<dynamic>.from(systemMessages.map((x) => x.toJson())),
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
      };
}

class Location {
  Location({
    required this.id,
    this.isGlobalId,
    required this.name,
    required this.disassembledName,
    required this.coord,
    required this.type,
    required this.matchQuality,
    required this.isBest,
    this.productClasses,
    required this.parent,
    this.properties,
  });

  String id;
  bool? isGlobalId;
  String name;
  String disassembledName;
  List<double> coord;
  String type;
  int matchQuality;
  bool isBest;
  List<int>? productClasses;
  Parent parent;
  Properties? properties;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        isGlobalId: json["isGlobalId"],
        name: json["name"],
        disassembledName: json["disassembledName"],
        coord: List<double>.from(json["coord"].map((x) => x)),
        type: json["type"],
        matchQuality: json["matchQuality"],
        isBest: json["isBest"],
        productClasses: json["productClasses"] == null
            ? []
            : List<int>.from(json["productClasses"]!.map((x) => x)),
        parent: Parent.fromJson(json["parent"]),
        properties: json["properties"] == null
            ? null
            : Properties.fromJson(json["properties"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isGlobalId": isGlobalId,
        "name": name,
        "disassembledName": disassembledName,
        "coord": List<dynamic>.from(coord.map((x) => x)),
        "type": type,
        "matchQuality": matchQuality,
        "isBest": isBest,
        "productClasses": productClasses == null
            ? []
            : List<dynamic>.from(productClasses!.map((x) => x)),
        "parent": parent.toJson(),
        "properties": properties?.toJson(),
      };
}

class Parent {
  Parent({
    required this.id,
    required this.name,
    required this.type,
  });

  String id;
  String name;
  String type;

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        id: json["id"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
      };
}

class Properties {
  Properties({
    required this.stopId,
  });

  String stopId;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        stopId: json["stopId"],
      );

  Map<String, dynamic> toJson() => {
        "stopId": stopId,
      };
}

class SystemMessage {
  SystemMessage({
    required this.type,
    required this.module,
    required this.code,
    required this.text,
  });

  String type;
  String module;
  int code;
  String text;

  factory SystemMessage.fromJson(Map<String, dynamic> json) => SystemMessage(
        type: json["type"],
        module: json["module"],
        code: json["code"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "module": module,
        "code": code,
        "text": text,
      };
}
