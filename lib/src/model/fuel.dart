import 'dart:convert';

import 'package:tankerkoenig_api/src/model/last_change.dart';

class TankerkoenigStationFuel {
  final String category;
  final String name;
  final double price;
  final TankerkoenigStationFuelLastChange lastChange;

  TankerkoenigStationFuel(
    this.category,
    this.name,
    this.price,
    this.lastChange,
  );

  static TankerkoenigStationFuel fromJson(
    Map<String, dynamic> json,
  ) {
    return TankerkoenigStationFuel(
      json['category'],
      json['name'],
      json['price'],
      TankerkoenigStationFuelLastChange.fromJson(
        json['lastChange'],
      ),
    );
  }

  static TankerkoenigStationFuel fromString(
    String string,
  ) {
    return fromJson(
      jsonDecode(string),
    );
  }
}
