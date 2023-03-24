import 'dart:convert';

class TankerkoenigStationOpeningTime {
  final List<String> days;
  final List<TankerkoenigStationOpeningTimeOpenClose> times;

  TankerkoenigStationOpeningTime(
    this.days,
    this.times,
  );

  static TankerkoenigStationOpeningTime fromJson(
    Map<String, dynamic> json,
  ) {
    return TankerkoenigStationOpeningTime(
      (json['days'] ?? [])
          .map<String>(
            (day) => day as String,
          )
          .toList(),
      (json['times'] ?? [])
          .map<TankerkoenigStationOpeningTimeOpenClose>(
            (time) => TankerkoenigStationOpeningTimeOpenClose.fromJson(
              time,
            ),
          )
          .toList(),
    );
  }

  static TankerkoenigStationOpeningTime fromString(
    String string,
  ) {
    return fromJson(
      jsonDecode(string),
    );
  }
}

class TankerkoenigStationOpeningTimeOpenClose {
  final String open;
  final String close;

  TankerkoenigStationOpeningTimeOpenClose(
    this.open,
    this.close,
  );

  static TankerkoenigStationOpeningTimeOpenClose fromJson(
    Map<String, dynamic> json,
  ) {
    return TankerkoenigStationOpeningTimeOpenClose(
      json['open'],
      json['close'],
    );
  }

  static TankerkoenigStationOpeningTimeOpenClose fromString(
    String string,
  ) {
    return fromJson(
      jsonDecode(string),
    );
  }
}
