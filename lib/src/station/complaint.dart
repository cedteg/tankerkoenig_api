import 'package:http/http.dart' as http;
import 'package:tankerkoenig_api/src/enum/correction_type.dart';

class Complaint {
  final String host;
  final String apiKey;

  Complaint(
    this.host,
    this.apiKey,
  );
  String get _getStationsByRadiusUrl => "$host/complaint";

  Future<int> post(
    String id,
    CorrectionType type,
    String correction,
  ) async {
    http.Response response =
        await http.post(Uri.parse(_getStationsByRadiusUrl), body: {
      'apikey': apiKey,
      'id': id,
      'type': type.name,
      'correction': correction,
    });
    return response.statusCode;
  }
}
