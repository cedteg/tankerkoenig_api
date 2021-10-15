import 'dart:convert';

class TankerkoenigStation {
  final String id;
  final String name;
  final String brand;
  final String street;
  final String place;
  final double lat;
  final double lng;
  final double dist;
  final double? diesel;
  final double? e5;
  final double? e10;
  final bool isOpen;
  final String houseNumer;
  final int postCode;

  TankerkoenigStation(
      this.id,
      this.name,
      this.brand,
      this.street,
      this.place,
      this.lat,
      this.lng,
      this.dist,
      this.diesel,
      this.e5,
      this.e10,
      this.isOpen,
      this.houseNumer,
      this.postCode);

  static TankerkoenigStation fromJson(Map<String, dynamic> json) {
    return TankerkoenigStation(
      json["id"],
      json["name"],
      json["brand"],
      json["street"],
      json["place"],
      json["lat"],
      json["lng"],
      json["dist"] + 0.0,
      json["diesel"],
      json["e5"],
      json["e10"],
      json["isOpen"],
      json["houseNumber"],
      json["postCode"],
    );
  }

  static TankerkoenigStation fromString(String string) {
    return fromJson(jsonDecode(string));
  }

  @override
  String toString() {
    return "TankerkoenigStation($id, $name, $brand, $street, $place, $lat, $lng, $dist, $diesel, $e5, $e10, $isOpen, $houseNumer, $place)";
  }
}
