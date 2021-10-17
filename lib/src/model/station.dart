import 'dart:convert';

import 'package:tankerkoenig_api/src/model/opening_time.dart';

class TankerkoenigStation {
  ///unique  station ID
  final String id;

  /// name
  final String name;

  /// brand
  final String brand;

  /// street
  final String street;
  // place
  final String place;

  /// Latitude
  final double lat;

  /// Longitude
  final double lng;

  /// Distance
  final double dist;

  /// price of Diesel
  final double? diesel;

  /// price of e5
  final double? e5;

  /// price of e10
  final double? e10;

  /// true, if the gas station is open at the time of the query is open, otherwise false
  final bool isOpen;

  /// housenumber
  final String houseNumber;

  /// postcode
  final int postCode;

  /// Array with regular opening hours
  final List<TankerkoenigOpeningTime>? openingTimes;

  /// Array with changed opening hours
  final List<String>? overrides;
  final bool? wholeDay;
  final String? state;

  /// Petrol Station
  TankerkoenigStation(
    this.id,
    this.name,
    this.brand,
    this.street,
    this.place,
    this.lat,
    this.lng,
    this.dist,
    this.diesel,
    this.e5,
    this.e10,
    this.isOpen,
    this.houseNumber,
    this.postCode,
    this.openingTimes,
    this.overrides,
    this.state,
    this.wholeDay,
  );

  /// Transfrom a Json to a TankerkoenigStation Object
  static TankerkoenigStation fromJson(
    Map<String, dynamic> json,
  ) {
    return TankerkoenigStation(
      json["id"],
      json["name"],
      json["brand"],
      json["street"],
      json["place"],
      json["lat"] + 0.0,
      json["lng"] + 0.0,
      json["dist"] + 0.0,
      json["diesel"],
      json["e5"],
      json["e10"],
      json["isOpen"],
      json["houseNumber"],
      json["postCode"],
      (json["openingTimes"] ?? [])
          .map<TankerkoenigOpeningTime>(
            (e) => TankerkoenigOpeningTime.fromJson(
              e,
            ),
          )
          .toList(),
      (json["overrides"] ?? [])
          ?.map<String>(
            (e) => e.toString(),
          )
          .toList(),
      json["wholeDay"],
      json["state"],
    );
  }

  /// Transfrom a String to a TankerkoenigStation Object
  static TankerkoenigStation fromString(
    String string,
  ) {
    return fromJson(
      jsonDecode(string),
    );
  }
}
