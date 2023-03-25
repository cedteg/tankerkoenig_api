import 'package:latlong2/latlong.dart';
import 'package:test/test.dart';
import 'package:tankerkoenig_api/tankerkoenig_api.dart';

void main() {
  group('Tankerkoenig', () {
    test('getStationsByRadius 200', () async {
      var response =
          await TankerkoenigApi("cffa4fb8-7a16-cd85-7946-263722530f15")
              .getStationsByRadius(
        LatLng(48.8, 9.24),
        1,
      );

      expect(response.runtimeType, TankerkoenigStationByRadiusResponse);
    });
    test('getStationsByRadius invalid key', () async {
      var response =
          await TankerkoenigApi("cffa4fb8-7a16-cd85-7946-").getStationsByRadius(
        LatLng(48.8, 9.24),
        1,
      );

      expect(response.runtimeType, TankerkoenigStationByRadiusResponseError);
      expect(response.status, 401);
    });
    test('getStationsByPostalcode invalid key', () async {
      var response = await TankerkoenigApi("cffa4fb8-7a16-cd85-7946-")
          .getStationsByPostalCode(
        49393,
      );

      expect(
          response.runtimeType, TankerkoenigStationByPostalCodeResponseError);
      expect(response.errorMessage,
          '{"statusCode":400,"message":"malformed apikey"}');
      expect(response.status, 400);
    });
    test('getStationsByPostalcode 200', () async {
      var response =
          await TankerkoenigApi("cffa4fb8-7a16-cd85-7946-263722530f15")
              .getStationsByPostalCode(
        49393,
      );
      expect(response.runtimeType, TankerkoenigStationByPostalCodeResponse);
      expect(response.status, 200);
    });

    test('getStationsByIds 200', () async {
      var response =
          await TankerkoenigApi("cffa4fb8-7a16-cd85-7946-263722530f15")
              .getStationsByIds(
        "92f703e8-0b3c-46da-9948-25cb1a6a1514,83d5ac80-4f23-4106-b054-7c7704bfcb95",
        LatLng(48.8, 9.24),
      );
      expect(response.runtimeType, TankerkoenigStationByIdsCodeResponse);
      expect(response.status, 200);
    });

    test('getStationsByIds 400', () async {
      var response =
          await TankerkoenigApi("cffa4fb8-7a16-cd85-7946-263722530f15")
              .getStationsByIds(
        "92f703e8-0b3c-46da-9948-25cb1a6a1514,83d5ac80-4f23-4106-b054-7c7704bfcb95,de",
        LatLng(48.8, 9.24),
      );
      expect(response.runtimeType, TankerkoenigStationByIdsCodeResponseError);
      expect(response.status, 400);
      expect(response.errorMessage,
          '{"statusCode":400,"message":"one or more ids have wrong format, or illegal country"}');
    });

    test('getStationsByIds invalid key', () async {
      var response =
          await TankerkoenigApi("cffa4fb8-7a16-cd85-7946-26372253015")
              .getStationsByIds(
        "92f703e8-0b3c-46da-9948-25cb1a6a1514,83d5ac80-4f23-4106-b054-7c7704bfcb95",
        LatLng(48.8, 9.24),
      );
      expect(response.runtimeType, TankerkoenigStationByIdsCodeResponseError);
      expect(response.status, 401);
    });
  });
}
