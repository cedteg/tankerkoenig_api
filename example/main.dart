import 'package:tankerkoenig_api/tankerkoenig_api.dart';

void main(List<String> arguments) async {
  TankerkoenigListResponse response =
      await TankerkoenigApi("invalid").getStationsByRadius(
    lat: 52.520008,
    lng: 13.404954,
    rad: 25,
    type: "all",
    sort: "dist",
  );
  print(response.stations?.length ?? "no stations");
}
