import 'package:tankerkoenig_api/src/model/opening_time.dart';
import 'package:test/test.dart';

void main() {
  group('OpeningTime', () {
    test('from json Map<String, dynamic>', () {
      Map<String, dynamic> json = {
        "text": "Mo-Fr",
        "start": "06:00:00",
        "end": "22:30:00"
      };
      OpeningTime valid = OpeningTime("Mo-Fr", "06:00:00", "22:30:00");
      OpeningTime fromJson = OpeningTime.fromJson(json);
      expect(fromJson.text, equals(valid.text));
      expect(fromJson.start, equals(valid.start));
      expect(fromJson.end, equals(valid.end));
    });
    test('from json Map<String, dynamic> multi', () {
      List<Map<String, dynamic>> json = [
        {"text": "Mo-Fr", "start": "06:00:00", "end": "22:30:00"},
        {"text": "Samstag", "start": "07:00:00", "end": "22:00:00"},
        {"text": "Sonntag", "start": "08:00:00", "end": "22:00:00"}
      ];
      List<OpeningTime> listValid = [
        OpeningTime("Mo-Fr", "06:00:00", "22:30:00"),
        OpeningTime("Samstag", "07:00:00", "22:00:00"),
        OpeningTime("Sonntag", "08:00:00", "22:00:00"),
      ];

      List<OpeningTime> listFromJson =
          json.map<OpeningTime>((e) => OpeningTime.fromJson(e)).toList();
      expect(listFromJson.length, equals(listValid.length));
      for (var i = 0; i < listFromJson.length; i++) {
        expect(listFromJson[i].text, listValid[i].text);
        expect(listFromJson[i].start, listValid[i].start);
        expect(listFromJson[i].end, listValid[i].end);
      }
    });
  });
}
