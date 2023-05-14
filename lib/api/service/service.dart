abstract class IService {
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });
}
