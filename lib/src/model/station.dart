import 'dart:convert';

import 'package:latlong2/latlong.dart';
import 'package:tankerkoenig_api/src/model/fuel.dart';
import 'package:tankerkoenig_api/src/model/opening_time.dart';

class TankerkoenigStation {
  final String country;
  final String id;
  final String name;
  final String brand;
  final String street;
  final String postalCode;
  final String place;
  final LatLng coords;
  final bool isOpen;
  final DateTime? closesAt;
  final double? distance;
  final List<TankerkoenigStationOpeningTime> openingTime;
  final List<TankerkoenigStationFuel> fuels;
  final int? volatility;

  TankerkoenigStation(
    this.id,
    this.country,
    this.name,
    this.brand,
    this.street,
    this.postalCode,
    this.place,
    this.coords,
    this.isOpen,
    this.closesAt,
    this.distance,
    this.openingTime,
    this.fuels,
    this.volatility,
  );

  static TankerkoenigStation fromJson(
    Map<String, dynamic> json,
  ) {
    return TankerkoenigStation(
      json['id'],
      json['country'],
      json['name'],
      json['brand'],
      json['street'],
      json['postalCode'],
      json['place'],
      LatLng(
        json['coords']['lat'],
        json['coords']['lng'],
      ),
      json['isOpen'],
      DateTime.tryParse(json['closesAt'] ?? ""),
      json['dist'],
      (json['openingTimes'] ?? [])
          .map<TankerkoenigStationOpeningTime>(
            (times) => TankerkoenigStationOpeningTime.fromJson(
              times,
            ),
          )
          .toList(),
      (json['fuels'] ?? [])
          .map<TankerkoenigStationFuel>(
            (fuel) => TankerkoenigStationFuel.fromJson(
              fuel,
            ),
          )
          .toList(),
      json['volatility'],
    );
  }

  static TankerkoenigStation fromString(
    String string,
  ) {
    return fromJson(
      jsonDecode(string),
    );
  }
}
