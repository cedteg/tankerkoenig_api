library tankerkoenig_api;

export 'src/model/station.dart';
export 'src/model/list_response.dart';

import 'src/model/list_response.dart';
import 'package:http/http.dart' as http;

class TankerkoenigApi {
  final String _apikey;

  TankerkoenigApi(
    this._apikey,
  );

  String _getRadiusHost() =>
      "https://creativecommons.tankerkoenig.de/json/list.php?apikey=$_apikey&";

  Future<TankerkoenigListResponse> getList({
    required double lat,
    required double lng,
    required double rad,
    String sort = "price",
    String type = "all",
  }) async {
    String params = [
      "lat=$lat",
      "lng=$lng",
      "rad=$rad",
      "sort=$sort",
      "type=$type"
    ].join("&");

    var response = await http.get(Uri.parse(_getRadiusHost() + params));
    if (response.statusCode == 200) {
      return TankerkoenigListResponse.fromString(response.body);
    }
    return TankerkoenigListResponse(
      false,
      null,
      null,
      null,
      null,
      "status code ${response.statusCode} - body :${response.body}",
    );
  }
}
