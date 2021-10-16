import 'package:test/test.dart';
import 'package:tankerkoenig_api/tankerkoenig_api.dart';

void main() {
  group('Tankerkoenig', () {
    test('lat lng 0', () async {
      TankerkoenigListResponse response =
          await TankerkoenigApi("065b57dd-ad9f-9d60-a255-662401a23480")
              .getStationsByRadius(
        lat: 0,
        lng: 0,
        rad: 25,
        type: "all",
        sort: "dist",
      );
      expect(response.status, equals("error"));
      expect(
        response.errorMessage,
        "lng nicht angegeben, oder ausserhalb der gültigen Grenzen\nlat nicht angegeben, oder ausserhalb der gültigen Grenzen",
      );
    });
    test('lat lng berlin', () async {
      TankerkoenigListResponse response =
          await TankerkoenigApi("065b57dd-ad9f-9d60-a255-662401a23480")
              .getStationsByRadius(
        lat: 52.520008,
        lng: 13.404954,
        rad: 25,
        type: "all",
        sort: "dist",
      );
      expect(response.status, equals("ok"));
    });
    test('lat lng berlin wrong sort on type', () async {
      TankerkoenigListResponse response =
          await TankerkoenigApi("065b57dd-ad9f-9d60-a255-662401a23480")
              .getStationsByRadius(
        lat: 52.520008,
        lng: 13.404954,
        rad: 25,
        type: "all",
        sort: "price",
      );
      expect(response.status, equals("error"));
      expect(
        response.errorMessage,
        "wenn type = all ist, muss sort 'dist' sein, oder sort Parameter weglassen",
      );
    });
    test('wrong apikey', () async {
      TankerkoenigListResponse response =
          await TankerkoenigApi("invalid").getStationsByRadius(
        lat: 52.520008,
        lng: 13.404954,
        rad: 25,
        type: "all",
        sort: "dist",
      );
      expect(response.status, equals("error"));
      expect(
        response.errorMessage,
        "apikey nicht angegeben, falsch, oder im falschen Format",
      );
    });
    test('wrong apikey', () async {
      TankerkoenigListResponse response =
          await TankerkoenigApi("invalid").getStationsByRadius(
        lat: 52.520008,
        lng: 13.404954,
        rad: 25,
        type: "all",
        sort: "dist",
      );
      expect(response.status, equals("error"));
      expect(
        response.errorMessage,
        "apikey nicht angegeben, falsch, oder im falschen Format",
      );
    });
  });
}
