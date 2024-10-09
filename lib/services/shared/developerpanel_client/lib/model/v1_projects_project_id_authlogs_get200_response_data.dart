//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class V1ProjectsProjectIDAuthlogsGet200ResponseData {
  /// Returns a new [V1ProjectsProjectIDAuthlogsGet200ResponseData] instance.
  V1ProjectsProjectIDAuthlogsGet200ResponseData({
    required this.paging,
    this.rows = const [],
  });

  Paging paging;

  List<AuthLog> rows;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is V1ProjectsProjectIDAuthlogsGet200ResponseData &&
          other.paging == paging &&
          _deepEquality.equals(other.rows, rows);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (paging.hashCode) + (rows.hashCode);

  @override
  String toString() =>
      'V1ProjectsProjectIDAuthlogsGet200ResponseData[paging=$paging, rows=$rows]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'paging'] = this.paging;
    json[r'rows'] = this.rows;
    return json;
  }

  /// Returns a new [V1ProjectsProjectIDAuthlogsGet200ResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static V1ProjectsProjectIDAuthlogsGet200ResponseData? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "V1ProjectsProjectIDAuthlogsGet200ResponseData[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "V1ProjectsProjectIDAuthlogsGet200ResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return V1ProjectsProjectIDAuthlogsGet200ResponseData(
        paging: Paging.fromJson(json[r'paging'])!,
        rows: AuthLog.listFromJson(json[r'rows']),
      );
    }
    return null;
  }

  static List<V1ProjectsProjectIDAuthlogsGet200ResponseData> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <V1ProjectsProjectIDAuthlogsGet200ResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            V1ProjectsProjectIDAuthlogsGet200ResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, V1ProjectsProjectIDAuthlogsGet200ResponseData> mapFromJson(
      dynamic json) {
    final map = <String, V1ProjectsProjectIDAuthlogsGet200ResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            V1ProjectsProjectIDAuthlogsGet200ResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of V1ProjectsProjectIDAuthlogsGet200ResponseData-objects as value to a dart map
  static Map<String, List<V1ProjectsProjectIDAuthlogsGet200ResponseData>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<V1ProjectsProjectIDAuthlogsGet200ResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            V1ProjectsProjectIDAuthlogsGet200ResponseData.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'paging',
    'rows',
  };
}