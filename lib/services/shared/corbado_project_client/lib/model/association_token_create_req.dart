//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AssociationTokenCreateReq {
  /// Returns a new [AssociationTokenCreateReq] instance.
  AssociationTokenCreateReq({
    required this.loginIdentifier,
    required this.loginIdentifierType,
    required this.clientInfo,
    this.requestID,
  });

  String loginIdentifier;

  LoginIdentifierType loginIdentifierType;

  ClientInfo clientInfo;

  /// Unique ID of request, you can provide your own while making the request, if not the ID will be randomly generated on server side
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? requestID;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssociationTokenCreateReq &&
          other.loginIdentifier == loginIdentifier &&
          other.loginIdentifierType == loginIdentifierType &&
          other.clientInfo == clientInfo &&
          other.requestID == requestID;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (loginIdentifier.hashCode) +
      (loginIdentifierType.hashCode) +
      (clientInfo.hashCode) +
      (requestID == null ? 0 : requestID!.hashCode);

  @override
  String toString() =>
      'AssociationTokenCreateReq[loginIdentifier=$loginIdentifier, loginIdentifierType=$loginIdentifierType, clientInfo=$clientInfo, requestID=$requestID]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'loginIdentifier'] = this.loginIdentifier;
    json[r'loginIdentifierType'] = this.loginIdentifierType;
    json[r'clientInfo'] = this.clientInfo;
    if (this.requestID != null) {
      json[r'requestID'] = this.requestID;
    } else {
      json[r'requestID'] = null;
    }
    return json;
  }

  /// Returns a new [AssociationTokenCreateReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AssociationTokenCreateReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "AssociationTokenCreateReq[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "AssociationTokenCreateReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AssociationTokenCreateReq(
        loginIdentifier: mapValueOfType<String>(json, r'loginIdentifier')!,
        loginIdentifierType:
            LoginIdentifierType.fromJson(json[r'loginIdentifierType'])!,
        clientInfo: ClientInfo.fromJson(json[r'clientInfo'])!,
        requestID: mapValueOfType<String>(json, r'requestID'),
      );
    }
    return null;
  }

  static List<AssociationTokenCreateReq> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <AssociationTokenCreateReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AssociationTokenCreateReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AssociationTokenCreateReq> mapFromJson(dynamic json) {
    final map = <String, AssociationTokenCreateReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AssociationTokenCreateReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AssociationTokenCreateReq-objects as value to a dart map
  static Map<String, List<AssociationTokenCreateReq>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<AssociationTokenCreateReq>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AssociationTokenCreateReq.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'loginIdentifier',
    'loginIdentifierType',
    'clientInfo',
  };
}
