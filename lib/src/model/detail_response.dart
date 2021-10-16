import 'dart:convert';

import 'station.dart';

/// Tankerkoenig Response for a single station
class TankerkoenigDetailResponse {
  final bool ok;
  final String? errorMessage;
  final String? license;
  final String? data;
  final String? status;
  final TankerkoenigStation? station;

  /// Tankerkoenig Response for a single station
  TankerkoenigDetailResponse(
    this.ok,
    this.license,
    this.data,
    this.status,
    this.station,
    this.errorMessage,
  );

  /// Transfrom a Json to a TankerkoenigDetailResponse Object
  static TankerkoenigDetailResponse fromJson(
    Map<String, dynamic> json,
  ) {
    return TankerkoenigDetailResponse(
      json["ok"],
      json["license"],
      json["data"],
      json["status"],
      json["station"] != null
          ? TankerkoenigStation.fromJson(
              json["station"],
            )
          : null,
      json["message"],
    );
  }

  /// Transfrom a String to a TankerkoenigDetailResponse Object
  static TankerkoenigDetailResponse fromString(
    String string,
  ) {
    return fromJson(
      jsonDecode(string),
    );
  }
}
