import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:tankerkoenig_api/src/model/response_by_radius.dart';

class ByRadius {
  final String host;
  final String apiKey;

  ByRadius(
    this.host,
    this.apiKey,
  );
  String get _getStationsByRadiusUrl => "$host/stations/search?apikey=$apiKey";

  Future<TankerkoenigStationByRadiusResponse> get(
    LatLng location,
    int rad,
  ) async {
    var url =
        "$_getStationsByRadiusUrl&lat=${location.latitude}&lng=${location.longitude}&rad=$rad";
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return TankerkoenigStationByRadiusResponse.fromString(
        response.body,
      );
    } else {
      return TankerkoenigStationByRadiusResponseError(
        response.body,
        response.statusCode,
      );
    }
  }
}
