import 'dart:convert';

import 'package:tankerkoenig_api/src/model/station.dart';

class TankerkoenigStationByIdsCodeResponse {
  final int? status;
  final String? errorMessage;
  final String? license;
  final String? timestamp;
  final List<TankerkoenigStation> stations;

  TankerkoenigStationByIdsCodeResponse(
    this.license,
    this.timestamp,
    this.stations, {
    this.errorMessage,
    this.status = 200,
  });

  static TankerkoenigStationByIdsCodeResponse fromJson(
    Map<String, dynamic> json,
  ) {
    return TankerkoenigStationByIdsCodeResponse(
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

  static TankerkoenigStationByIdsCodeResponse fromString(
    String string,
  ) {
    return fromJson(
      jsonDecode(string),
    );
  }
}

class TankerkoenigStationByIdsCodeResponseError
    extends TankerkoenigStationByIdsCodeResponse {
  TankerkoenigStationByIdsCodeResponseError(
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
