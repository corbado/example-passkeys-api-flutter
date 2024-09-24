//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TrackingRawListRsp {
  /// Returns a new [TrackingRawListRsp] instance.
  TrackingRawListRsp({
    required this.httpStatusCode,
    required this.message,
    required this.requestData,
    required this.runtime,
    this.rows = const [],
    required this.paging,
  });

  /// HTTP status code of operation
  ///
  /// Minimum value: 200
  /// Maximum value: 599
  int httpStatusCode;

  String message;

  RequestData requestData;

  /// Runtime in seconds for this request
  double runtime;

  List<TrackingRawListRow> rows;

  Paging paging;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrackingRawListRsp &&
          other.httpStatusCode == httpStatusCode &&
          other.message == message &&
          other.requestData == requestData &&
          other.runtime == runtime &&
          other.rows == rows &&
          other.paging == paging;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (httpStatusCode.hashCode) +
      (message.hashCode) +
      (requestData.hashCode) +
      (runtime.hashCode) +
      (rows.hashCode) +
      (paging.hashCode);

  @override
  String toString() =>
      'TrackingRawListRsp[httpStatusCode=$httpStatusCode, message=$message, requestData=$requestData, runtime=$runtime, rows=$rows, paging=$paging]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'httpStatusCode'] = this.httpStatusCode;
    json[r'message'] = this.message;
    json[r'requestData'] = this.requestData;
    json[r'runtime'] = this.runtime;
    json[r'rows'] = this.rows;
    json[r'paging'] = this.paging;
    return json;
  }

  /// Returns a new [TrackingRawListRsp] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TrackingRawListRsp? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "TrackingRawListRsp[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "TrackingRawListRsp[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TrackingRawListRsp(
        httpStatusCode: mapValueOfType<int>(json, r'httpStatusCode')!,
        message: mapValueOfType<String>(json, r'message')!,
        requestData: RequestData.fromJson(json[r'requestData'])!,
        runtime: mapValueOfType<double>(json, r'runtime')!,
        rows: TrackingRawListRow.listFromJson(json[r'rows']),
        paging: Paging.fromJson(json[r'paging'])!,
      );
    }
    return null;
  }

  static List<TrackingRawListRsp> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <TrackingRawListRsp>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TrackingRawListRsp.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TrackingRawListRsp> mapFromJson(dynamic json) {
    final map = <String, TrackingRawListRsp>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TrackingRawListRsp.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TrackingRawListRsp-objects as value to a dart map
  static Map<String, List<TrackingRawListRsp>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<TrackingRawListRsp>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TrackingRawListRsp.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'httpStatusCode',
    'message',
    'requestData',
    'runtime',
    'rows',
    'paging',
  };
}
