import 'package:http/http.dart' as http;
import 'package:tankerkoenig_api/src/model/response_by_postalcode.dart';

class ByPostalCode {
  final String host;
  final String apiKey;

  ByPostalCode(
    this.host,
    this.apiKey,
  );
  String get _getStationsByRadiusUrl =>
      "$host/stations/postalcode?apikey=$apiKey";

  Future<TankerkoenigStationByPostalCodeResponse> get(
    int postalcode,
  ) async {
    var url = "$_getStationsByRadiusUrl&postalcode=$postalcode";
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return TankerkoenigStationByPostalCodeResponse.fromString(
        response.body,
      );
    } else {
      return TankerkoenigStationByPostalCodeResponseError(
        response.body,
        response.statusCode,
      );
    }
  }
}
