// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:latlong2/latlong.dart';
import 'package:tankerkoenig_api/tankerkoenig_api.dart';

void main(List<String> arguments) async {
  var response;
  TankerkoenigApi api = TankerkoenigApi("cffa4fb8-7a16-cd85-7946-263722530f15");
  response = await api.getStationsByRadius(
    LatLng(
      48.8,
      9.24,
    ),
    1,
  );

  response = await api.getStationsByPostalCode(
    49393,
  );

  response = await api.getStationsByIds(
    "92f703e8-0b3c-46da-9948-25cb1a6a1514,83d5ac80-4f23-4106-b054-7c7704bfcb95",
    LatLng(
      48.8,
      9.24,
    ),
  );
  print(response);
}
