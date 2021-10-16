import 'dart:convert';

/// OpeningTime
class OpeningTime {
  final String text;
  final String start;
  final String end;

  /// OpeningTime
  OpeningTime(
    this.text,
    this.start,
    this.end,
  );

  /// Transfrom a Json to a TankerkoenigStation Object
  static OpeningTime fromJson(
    Map<String, dynamic> json,
  ) {
    return OpeningTime(
      json["text"],
      json["start"],
      json["end"],
    );
  }

  /// Transfrom a String to a TankerkoenigStation Object
  static OpeningTime fromString(
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
