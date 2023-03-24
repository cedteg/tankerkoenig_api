import 'dart:convert';

class TankerkoenigStationFuelLastChange {
  final DateTime timestamp;
  final double amount;

  TankerkoenigStationFuelLastChange(
    this.timestamp,
    this.amount,
  );

  static TankerkoenigStationFuelLastChange fromJson(
    Map<String, dynamic> json,
  ) {
    return TankerkoenigStationFuelLastChange(
      DateTime.parse(
        json['timestamp'],
      ),
      json['amount'],
    );
  }

  static TankerkoenigStationFuelLastChange fromString(
    String string,
  ) {
    return fromJson(
      jsonDecode(string),
    );
  }
}
