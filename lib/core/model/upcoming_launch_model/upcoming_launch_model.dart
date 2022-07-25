import 'package:json_annotation/json_annotation.dart';

part 'upcoming_launch_model.g.dart';

@JsonSerializable()
class UpcomingLaunchData {
  /// String values
  final String? id;
  final String? launch_library_id;
  final String? name;
  final String? rocket;
  final String? launchpad;
  final String? date_utc;
  final String? date_local;
  final String? date_precision;
  final String? details;
  final bool? isUpcoming;
  final bool? auto_update;
  final int? flight_number;
  final Map<String, dynamic>? links;

  UpcomingLaunchData({
    this.id,
    this.launch_library_id,
    this.name,
    this.rocket,
    this.launchpad,
    this.date_utc,
    this.date_precision,
    this.isUpcoming,
    this.auto_update,
    this.flight_number,
    this.links,
    this.date_local,
    this.details,
  });

  /// factory.
  factory UpcomingLaunchData.fromJson(Map<String, dynamic> json) =>
      _$UpcomingLaunchDataFromJson(json);

  // To Json
  Map<String, dynamic> toJson() => _$UpcomingLaunchDataToJson(this);
}
