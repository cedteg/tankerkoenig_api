import 'dart:convert';

/// OpeningTime
class TankerkoenigOpeningTime {
  final String text;
  final String start;
  final String end;

  /// OpeningTime
  TankerkoenigOpeningTime(
    this.text,
    this.start,
    this.end,
  );

  /// Transfrom a Json to a TankerkoenigStation Object
  static TankerkoenigOpeningTime fromJson(
    Map<String, dynamic> json,
  ) {
    return TankerkoenigOpeningTime(
      json["text"],
      json["start"],
      json["end"],
    );
  }

  /// Transfrom a String to a TankerkoenigStation Object
  static TankerkoenigOpeningTime fromString(
    String string,
  ) {
    return fromJson(
      jsonDecode(string),
    );
  }

  @override
  String toString() {
    return '{"text":"$text", "start":"$start", "end":"$end"}';
  }
}
