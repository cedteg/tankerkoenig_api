import 'dart:convert';

import 'package:latlong2/latlong.dart';
import 'package:tankerkoenig_api/src/model/station.dart';

class TankerkoenigStationByRadiusResponse {
  final int? status;
  final LatLng searchCenter;
  final String? errorMessage;
  final String? license;
  final String? timestamp;
  final List<TankerkoenigStation> stations;

  TankerkoenigStationByRadiusResponse(
    this.searchCenter,
    this.license,
    this.timestamp,
    this.stations, {
    this.errorMessage,
    this.status,
  });

  static TankerkoenigStationByRadiusResponse fromJson(
    Map<String, dynamic> json,
  ) {
    return TankerkoenigStationByRadiusResponse(
      LatLng(
        json["searchCenter"]["lat"],
        json["searchCenter"]["lng"],
      ),
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

  static TankerkoenigStationByRadiusResponse fromString(
    String string,
  ) {
    return fromJson(
      jsonDecode(string),
    );
  }
}

class TankerkoenigStationByRadiusResponseError
    extends TankerkoenigStationByRadiusResponse {
  TankerkoenigStationByRadiusResponseError(
    String? errorMessage,
    int status,
  ) : super(
          LatLng(0, 0),
          "",
          "",
          [],
          errorMessage: errorMessage,
          status: status,
        );
}
