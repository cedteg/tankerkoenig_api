/// This package implement the tankerkoenig api. With this api you can get acces to the german patrol station information with diesel, e5 and e10. This plugin is not developed by tankerkönig!
library tankerkoenig_api;

export 'src/model/station.dart';
export 'src/model/list_response.dart';
export 'src/model/list_response_error.dart';
export 'src/model/detail_response.dart';
export 'src/model/detail_response_error.dart';

import 'src/model/list_response.dart';
import 'src/model/list_response_error.dart';
import 'src/model/detail_response.dart';
import 'src/model/detail_response_error.dart';
import 'package:http/http.dart' as http;

/// Dart implementation for the Tankerkönig API
class TankerkoenigApi {
  final String apikey;

  /// Acces the german patrol station api Tankerkönig
  ///
  /// The Apikey is required to authenticate against the tankerkienig api
  /// you can get an [apikey] via https://creativecommons.tankerkoenig.de/
  const TankerkoenigApi(
    this.apikey,
  );

  /// internal function
  String _getRadiusHost() =>
      "https://creativecommons.tankerkoenig.de/json/list.php?apikey=$apikey&";

  /// internal function
  String _getDetailHost() =>
      "https://creativecommons.tankerkoenig.de/json/detail.php?apikey=$apikey&id=";

  /// Get all German petrol stations within the specify radius
  ///
  /// [lat] & [lng] is required to specify the location to search in
  ///
  /// [rad] is required to specify the radius around the location to search for
  /// Range is 1...25 km
  ///
  /// [sort] to specify how the list should be sorted.
  /// Default: "dist"
  /// Possible values:
  /// - dist -> distance
  /// - price -> price
  ///
  /// [type] to search the on individual fuel prices
  /// Default: "all"
  /// Possible values:
  /// - all
  /// - diesel
  /// - e5
  /// - e10
  Future<TankerkoenigListResponse> getStationsByRadius({
    required double lat,
    required double lng,
    required double rad,
    String sort = "dist",
    String type = "all",
  }) async {
    String params = [
      "lat=$lat",
      "lng=$lng",
      "rad=$rad",
      "sort=$sort",
      "type=$type"
    ].join("&");

    var response = await http.get(
      Uri.parse(
        _getRadiusHost() + params,
      ),
    );
    if (response.statusCode == 200) {
      return TankerkoenigListResponse.fromString(
        response.body,
      );
    }
    return TankerkoenigListResponseError(
      "status code ${response.statusCode} - body :${response.body}",
    );
  }

  /// Get detailed information for a signle German petrol station
  Future<TankerkoenigDetailResponse> getStationDetail({
    required String id,
  }) async {
    var response = await http.get(
      Uri.parse(
        _getDetailHost() + id,
      ),
    );
    if (response.statusCode == 200) {
      return TankerkoenigDetailResponse.fromString(
        response.body,
      );
    }
    return TankerkoenigDetailResponseError(
      "status code ${response.statusCode} - body :${response.body}",
    );
  }
}
