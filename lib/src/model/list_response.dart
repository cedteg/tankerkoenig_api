import 'dart:convert';

import 'station.dart';

class TankerkoenigListResponse {
  final bool ok;
  final String? errorMessage;
  final String? license;
  final String? data;
  final String? status;
  final List<TankerkoenigStation>? stations;

  TankerkoenigListResponse(
    this.ok,
    this.license,
    this.data,
    this.status,
    this.stations,
    this.errorMessage,
  );

  static TankerkoenigListResponse fromJson(Map<String, dynamic> json) {
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

  static TankerkoenigListResponse fromString(String string) {
    return fromJson(
      jsonDecode(string),
    );
  }
}
