import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:tankerkoenig_api/src/model/response_by_id.dart';

class ByIds {
  final String host;
  final String apiKey;

  ByIds(
    this.host,
    this.apiKey,
  );
  String get _getStationsByRadiusUrl => "$host/stations/ids?apikey=$apiKey";

  Future<TankerkoenigStationByIdsCodeResponse> get(
    String ids,
    LatLng location,
  ) async {
    var url =
        "$_getStationsByRadiusUrl&ids=$ids&lat=${location.latitude}&lng=${location.longitude}";
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return TankerkoenigStationByIdsCodeResponse.fromString(
        response.body,
      );
    } else {
      return TankerkoenigStationByIdsCodeResponseError(
        response.body,
        response.statusCode,
      );
    }
  }
}
