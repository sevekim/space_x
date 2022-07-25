// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_launch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingLaunchData _$UpcomingLaunchDataFromJson(Map<String, dynamic> json) =>
    UpcomingLaunchData(
      id: json['id'] as String?,
      launch_library_id: json['launch_library_id'] as String?,
      name: json['name'] as String?,
      rocket: json['rocket'] as String?,
      launchpad: json['launchpad'] as String?,
      date_utc: json['date_utc'] as String?,
      date_precision: json['date_precision'] as String?,
      isUpcoming: json['isUpcoming'] as bool?,
      auto_update: json['auto_update'] as bool?,
      flight_number: json['flight_number'] as int?,
      links: json['links'] as Map<String, dynamic>?,
      date_local: json['date_local'] as String?,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$UpcomingLaunchDataToJson(UpcomingLaunchData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'launch_library_id': instance.launch_library_id,
      'name': instance.name,
      'rocket': instance.rocket,
      'launchpad': instance.launchpad,
      'date_utc': instance.date_utc,
      'date_local': instance.date_local,
      'date_precision': instance.date_precision,
      'details': instance.details,
      'isUpcoming': instance.isUpcoming,
      'auto_update': instance.auto_update,
      'flight_number': instance.flight_number,
      'links': instance.links,
    };
