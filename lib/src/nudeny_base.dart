import 'package:dio/dio.dart';

// TODO: Put public facing types in this file.

/// Return nudeity classification and detection predictions.
class Nudeny {
  final url = 'http://ec2-18-136-200-224.ap-southeast-1.compute.amazonaws.com';
  final dio = Dio();

  /// Sends a list of files located at the given file paths to a remote classification API for processing.
  ///
  /// The function reads the file data from disk, constructs a multipart/form-data request containing
  /// the files, and sends the request to the API server using the Dio HTTP client library. The response
  /// from the server is returned as a dynamic object.
  ///
  /// If an error occurs during the process, the function will print an error message to the console and
  /// rethrow the original exception, preserving the original stack trace.
  ///
  /// Usage example:
  ///
  /// ```
  /// var result = await classify(['path/to/file1.jpg', 'path/to/file2.jpg']);
  /// print(result);
  /// ```
  ///
  /// Throws a [DioError] if the HTTP request fails, or any other exception that occurs during processing.
  Future<dynamic> classify(List<String> paths) async {
    try {
      final List files = [];

      for (final path in paths) {
        files.add(MultipartFile.fromFileSync(path));
      }

      final formData = FormData.fromMap({'files': files});

      final response = await dio.post(url + '/classify/', data: formData);

      return response.data;
    } catch (e) {
      print('Error occured: ${e}');
      rethrow;
    }
  }

  /// Sends a list of image URLs to a remote classification API for processing.
  ///
  /// The function constructs a JSON request containing the URLs, and sends the request
  /// to the API server using the Dio HTTP client library. The response from the server
  /// is returned as a dynamic object.
  ///
  /// Each URL should point to an image file that the API can process. The URLs must be
  /// publicly accessible and should not require authentication to access.
  ///
  /// If an error occurs during the process, the function will print an error message to
  /// the console and rethrow the original exception, preserving the original stack trace.
  ///
  /// Usage example:
  ///
  /// ```
  /// var result = await classifyUrl(['https://example.com/image1.jpg', 'https://example.com/image2.jpg']);
  /// print(result);
  /// ```
  ///
  /// Throws a [DioError] if the HTTP request fails, or any other exception that occurs during processing.
  Future<dynamic> classifyUrl(List<String> urls) async {
    try {
      final List<Map<String, String>> urlMaps = [];

      for (final url in urls) {
        urlMaps.add({"source": url});
      }

      final response = await dio.post(url + '/classify-url/', data: urlMaps);

      return response.data;
    } catch (e) {
      print('Error occured: ${e}');
      rethrow;
    }
  }

  /// Sends a list of files located at the given file paths to a remote object detection API for processing.
  ///
  /// The function reads the file data from disk, constructs a multipart/form-data request containing
  /// the files, and sends the request to the API server using the Dio HTTP client library. The response
  /// from the server is returned as a dynamic object.
  ///
  /// If an error occurs during the process, the function will print an error message to the console and
  /// rethrow the original exception, preserving the original stack trace.
  ///
  /// Usage example:
  ///
  /// ```
  /// var result = await detect(['path/to/image1.jpg', 'path/to/image2.jpg']);
  /// print(result);
  /// ```
  ///
  /// Throws a [DioError] if the HTTP request fails, or any other exception that occurs during processing.
  Future<dynamic> detect(List<String> paths) async {
    try {
      final List files = [];

      for (final path in paths) {
        files.add(MultipartFile.fromFileSync(path));
      }

      final formData = FormData.fromMap({'files': files});

      final response = await dio.post(url + '/detect/', data: formData);

      return response.data;
    } catch (e) {
      print('Error occured: ${e}');
      rethrow;
    }
  }

  /// Sends a list of image URLs to a remote object detection API for processing.
  ///
  /// The function constructs a JSON payload containing the URLs and sends an HTTP POST request to the API server
  /// using the Dio HTTP client library. The response from the server is returned as a dynamic object.
  ///
  /// If an error occurs during the process, the function will print an error message to the console and
  /// rethrow the original exception, preserving the original stack trace.
  ///
  /// Usage example:
  ///
  /// ```
  /// var result = await detectUrl(['https://example.com/image1.jpg', 'https://example.com/image2.jpg']);
  /// print(result);
  /// ```
  ///
  /// Throws a [DioError] if the HTTP request fails, or any other exception that occurs during processing.
  Future<dynamic> detectUrl(List<String> urls) async {
    try {
      final List<Map<String, String>> urlMaps = [];

      for (final url in urls) {
        urlMaps.add({"source": url});
      }

      final response = await dio.post(url + '/detect-url/', data: urlMaps);

      return response.data;
    } catch (e) {
      print('Error occured: ${e}');
      rethrow;
    }
  }

  /// Sends a list of images to a remote image censorship API for processing.
  ///
  /// The function reads the image files from disk and constructs a `FormData` object containing the images.
  /// It then sends an HTTP POST request to the censorship API server using the Dio HTTP client library. The
  /// response from the server is returned as a dynamic object.
  ///
  /// If an error occurs during the process, the function will print an error message to the console and
  /// rethrow the original exception, preserving the original stack trace.
  ///
  /// Usage example:
  ///
  /// ```
  /// var result = await censor(['path/to/image1.jpg', 'path/to/image2.png']);
  /// print(result);
  /// ```
  ///
  /// Throws a [DioError] if the HTTP request fails, or any other exception that occurs during processing.
  Future<dynamic> censor(List<String> paths) async {
    try {
      final List files = [];

      for (final path in paths) {
        files.add(MultipartFile.fromFileSync(path));
      }

      final formData = FormData.fromMap({'files': files});

      final response = await dio.post(url + '/censor/', data: formData);

      return response.data;
    } catch (e) {
      print('Error occured: ${e}');
      rethrow;
    }
  }

  /// Sends a list of image URLs to a remote image censorship API for processing.
  ///
  /// The function constructs a `List` of `Map` objects, where each map contains a single key-value pair
  /// representing the URL of an image to be censored. It then sends an HTTP POST request to the censorship
  /// API server using the Dio HTTP client library. The response from the server is returned as a dynamic
  /// object.
  ///
  /// If an error occurs during the process, the function will print an error message to the console and
  /// rethrow the original exception, preserving the original stack trace.
  ///
  /// Usage example:
  ///
  /// ```
  /// var result = await censorUrl(['https://example.com/image1.jpg', 'https://example.com/image2.png']);
  /// print(result);
  /// ```
  ///
  /// Throws a [DioError] if the HTTP request fails, or any other exception that occurs during processing.
  Future<dynamic> censorUrl(List<String> urls) async {
    try {
      final List<Map<String, String>> urlMaps = [];

      for (final url in urls) {
        urlMaps.add({"source": url});
      }

      final response = await dio.post(url + '/censor-url/', data: urlMaps);

      return response.data;
    } catch (e) {
      print('Error occured: ${e}');
      rethrow;
    }
  }
}
