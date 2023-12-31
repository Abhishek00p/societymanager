
/// [Endpoint] enum contains the API Path
enum Endpoint {
//   getUserAndProvideDeviceToken,
  getAllTask,
  getJobSuggestion
}

/// API contains all the endpoints that
/// provides data from the backend resources
class API {
  /// Get Host
  API({
    required this.host,
  });

  /// Base Path of the API
  final String host;

  static const Map<String, String> _headers = {
    'Content-Type': 'application/json',
  };

  Map<String, String> get apiHeaders => _headers;

  /// Endpoint Uri
  Uri endpointUri(
    Endpoint endpoint, {
    String prefix = '/api/v1',
    List<String> pathSegments = const <String>[],
    Map<String, String> queryParameters = const <String, String>{},
  }) =>
      Uri(
        scheme: 'https',
        host: host,
        path: '$prefix${_path[endpoint]}${pathSegments.join('/')}',
        // pathSegments: <String>[
        //   _path[endpoint] ?? '',
        //   ...pathSegments,
        // ],
        queryParameters: queryParameters,
      );

  /// Make sure the path should have the '/' prefix always
  /// when mapping endpoints
  static const Map<Endpoint, String> _path = <Endpoint, String>{
    /// Outlet
    Endpoint.getAllTask: '/jobApplicants',
    Endpoint.getJobSuggestion: '/jobs',
  };
}
