import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

// TimestampとDateTimeの変換(required)
class RequiredTimestampDateTimeConverter
    implements JsonConverter<DateTime, Timestamp> {
  const RequiredTimestampDateTimeConverter();

  @override
  DateTime fromJson(Timestamp stamp) => stamp.toDate();

  @override
  Timestamp toJson(DateTime time) => Timestamp.fromDate(time);
}

// TimestampとDateTimeの変換(no-required)
class TimestampDateTimeConverter
    implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampDateTimeConverter();

  @override
  DateTime? fromJson(Timestamp? stamp) => stamp?.toDate();

  @override
  Timestamp? toJson(DateTime? time) {
    if (time == null) {
      return null;
    }
    return Timestamp.fromDate(time);
  }
}
