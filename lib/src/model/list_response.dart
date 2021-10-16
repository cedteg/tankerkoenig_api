import 'dart:convert';

import 'station.dart';

/// Tankerkoenig Response for the search by Radius
class TankerkoenigListResponse {
  final bool ok;
  final String? errorMessage;
  final String? license;
  final String? data;
  final String? status;
  final List<TankerkoenigStation>? stations;

  /// Tankerkoenig Response for the search by Radius
  TankerkoenigListResponse(
    this.ok,
    this.license,
    this.data,
    this.status,
    this.stations,
    this.errorMessage,
  );

  /// Transfrom a Json to a TankerkoenigListResponse Object
  static TankerkoenigListResponse fromJson(
    Map<String, dynamic> json,
  ) {
    return TankerkoenigListResponse(
      json["ok"],
      json["license"],
      json["data"],
      json["status"],
      (json["stations"] ?? [])
          .map<TankerkoenigStation>(
            (e) => TankerkoenigStation.fromJson(e),
          )
          .toList(),
      json["message"],
    );
  }

  /// Transfrom a String to a TankerkoenigListResponse Object
  static TankerkoenigListResponse fromString(
    String string,
  ) {
    return fromJson(
      jsonDecode(string),
    );
  }
}
