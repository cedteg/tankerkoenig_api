import 'package:test/test.dart';
import '../../bin/tankerkoenig_api.dart';

void main() {
  group('Tankerkoenig', () {
    test('from json Map<String, dynamic>', () {
      Map<String, dynamic> json = {
        "id": "474e5046-deaf-4f9b-9a32-9797b778f047",
        "name": "TOTAL BERLIN",
        "brand": "TOTAL",
        "street": "MARGARETE-SOMMER-STR.",
        "place": "BERLIN",
        "lat": 52.53083,
        "lng": 13.440946,
        "dist": 1.1,
        "diesel": 1.109,
        "e5": 1.339,
        "e10": 1.319,
        "isOpen": true,
        "houseNumber": "2",
        "postCode": 10407
      };
      TankerkoenigStation valid = TankerkoenigStation(
        "474e5046-deaf-4f9b-9a32-9797b778f047",
        "TOTAL BERLIN",
        "TOTAL",
        "MARGARETE-SOMMER-STR.",
        "BERLIN",
        52.53083,
        13.440946,
        1.1,
        1.109,
        1.339,
        1.319,
        true,
        "2",
        10407,
      );
      TankerkoenigStation fromJson = TankerkoenigStation.fromJson(json);
      expect(fromJson.id, equals(valid.id));
      expect(fromJson.name, equals(valid.name));
      expect(fromJson.brand, equals(valid.brand));
      expect(fromJson.street, equals(valid.street));
      expect(fromJson.place, equals(valid.place));
      expect(fromJson.lat, equals(valid.lat));
      expect(fromJson.lng, equals(valid.lng));
      expect(fromJson.dist, equals(valid.dist));
      expect(fromJson.diesel, equals(valid.diesel));
      expect(fromJson.e5, equals(valid.e5));
      expect(fromJson.e10, equals(valid.e10));
      expect(fromJson.isOpen, equals(valid.isOpen));
      expect(fromJson.houseNumer, equals(valid.houseNumer));
      expect(fromJson.postCode, equals(valid.postCode));
    });
    test('from String', () {
      String s =
          '{"id": "474e5046-deaf-4f9b-9a32-9797b778f047","name": "TOTAL BERLIN","brand": "TOTAL","street": "MARGARETE-SOMMER-STR.","place": "BERLIN","lat": 52.53083,"lng": 13.440946,"dist": 1.1,"diesel": 1.109,"e5": 1.339,"e10": 1.319,"isOpen": true,"houseNumber": "2","postCode": 10407}';
      TankerkoenigStation valid = TankerkoenigStation(
        "474e5046-deaf-4f9b-9a32-9797b778f047",
        "TOTAL BERLIN",
        "TOTAL",
        "MARGARETE-SOMMER-STR.",
        "BERLIN",
        52.53083,
        13.440946,
        1.1,
        1.109,
        1.339,
        1.319,
        true,
        "2",
        10407,
      );
      TankerkoenigStation fromJson = TankerkoenigStation.fromString(s);
      expect(fromJson.id, equals(valid.id));
      expect(fromJson.name, equals(valid.name));
      expect(fromJson.brand, equals(valid.brand));
      expect(fromJson.street, equals(valid.street));
      expect(fromJson.place, equals(valid.place));
      expect(fromJson.lat, equals(valid.lat));
      expect(fromJson.lng, equals(valid.lng));
      expect(fromJson.dist, equals(valid.dist));
      expect(fromJson.diesel, equals(valid.diesel));
      expect(fromJson.e5, equals(valid.e5));
      expect(fromJson.e10, equals(valid.e10));
      expect(fromJson.isOpen, equals(valid.isOpen));
      expect(fromJson.houseNumer, equals(valid.houseNumer));
      expect(fromJson.postCode, equals(valid.postCode));
    });
  });
}