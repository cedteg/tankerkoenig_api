import 'dart:convert';

import 'package:tankerkoenig_api/src/model/station.dart';

class TankerkoenigStationByPostalCodeResponse {
  final int? status;
  final String? errorMessage;
  final String? license;
  final String? timestamp;
  final List<TankerkoenigStation> stations;

  TankerkoenigStationByPostalCodeResponse(
    this.license,
    this.timestamp,
    this.stations, {
    this.errorMessage,
    this.status = 200,
  });

  static TankerkoenigStationByPostalCodeResponse fromJson(
    Map<String, dynamic> json,
  ) {
    return TankerkoenigStationByPostalCodeResponse(
      json["license"],
      json["timestamp"],
      (json["stations"] ?? [])
          .map<TankerkoenigStation>(
            (station) => TankerkoenigStation.fromJson(
              station,
            ),
          )
          .toList(),
    );
  }

  static TankerkoenigStationByPostalCodeResponse fromString(
    String string,
  ) {
    return fromJson(
      jsonDecode(string),
    );
  }
}

class TankerkoenigStationByPostalCodeResponseError
    extends TankerkoenigStationByPostalCodeResponse {
  TankerkoenigStationByPostalCodeResponseError(
    String? errorMessage,
    int status,
  ) : super(
          "",
          "",
          [],
          errorMessage: errorMessage,
          status: status,
        );
}
