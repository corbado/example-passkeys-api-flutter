//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectsApi {
  ProjectsApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete a project
  ///
  /// Deletes a project with the specified project ID. Only the owner can delete the project.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [V1ProjectsDeleteDeleteRequest] v1ProjectsDeleteDeleteRequest (required):
  Future<Response> v1ProjectsDeleteDeleteWithHttpInfo(
    V1ProjectsDeleteDeleteRequest v1ProjectsDeleteDeleteRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/projects/delete';

    // ignore: prefer_final_locals
    Object? postBody = v1ProjectsDeleteDeleteRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Delete a project
  ///
  /// Deletes a project with the specified project ID. Only the owner can delete the project.
  ///
  /// Parameters:
  ///
  /// * [V1ProjectsDeleteDeleteRequest] v1ProjectsDeleteDeleteRequest (required):
  Future<V1ProjectsDeleteDelete200Response?> v1ProjectsDeleteDelete(
    V1ProjectsDeleteDeleteRequest v1ProjectsDeleteDeleteRequest,
  ) async {
    final response = await v1ProjectsDeleteDeleteWithHttpInfo(
      v1ProjectsDeleteDeleteRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'V1ProjectsDeleteDelete200Response',
      ) as V1ProjectsDeleteDelete200Response;
    }
    return null;
  }

  /// List projects
  ///
  /// Returns a paginated list of projects for the authenticated user.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] page:
  ///   The page number for pagination (defaults to 1).
  ///
  /// * [int] pageSize:
  ///   The number of items per page (defaults to 10, max 100).
  Future<Response> v1ProjectsGetWithHttpInfo({
    int? page,
    int? pageSize,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/projects';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (page != null) {
      queryParams.addAll(_queryParams('', 'page', page));
    }
    if (pageSize != null) {
      queryParams.addAll(_queryParams('', 'pageSize', pageSize));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List projects
  ///
  /// Returns a paginated list of projects for the authenticated user.
  ///
  /// Parameters:
  ///
  /// * [int] page:
  ///   The page number for pagination (defaults to 1).
  ///
  /// * [int] pageSize:
  ///   The number of items per page (defaults to 10, max 100).
  Future<V1ProjectsGet200Response?> v1ProjectsGet({
    int? page,
    int? pageSize,
  }) async {
    final response = await v1ProjectsGetWithHttpInfo(
      page: page,
      pageSize: pageSize,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'V1ProjectsGet200Response',
      ) as V1ProjectsGet200Response;
    }
    return null;
  }

  /// Create a new project
  ///
  /// Creates a new project for the authenticated user.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [V1ProjectsPostRequest] v1ProjectsPostRequest (required):
  Future<Response> v1ProjectsPostWithHttpInfo(
    V1ProjectsPostRequest v1ProjectsPostRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/projects';

    // ignore: prefer_final_locals
    Object? postBody = v1ProjectsPostRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Create a new project
  ///
  /// Creates a new project for the authenticated user.
  ///
  /// Parameters:
  ///
  /// * [V1ProjectsPostRequest] v1ProjectsPostRequest (required):
  Future<V1ProjectsPost200Response?> v1ProjectsPost(
    V1ProjectsPostRequest v1ProjectsPostRequest,
  ) async {
    final response = await v1ProjectsPostWithHttpInfo(
      v1ProjectsPostRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'V1ProjectsPost200Response',
      ) as V1ProjectsPost200Response;
    }
    return null;
  }
}