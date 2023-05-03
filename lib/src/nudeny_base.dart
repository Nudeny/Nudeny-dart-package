import 'package:dio/dio.dart';

// TODO: Put public facing types in this file.

/// Return nudeity classification and detection predictions.
class Nudeny {
  final URL = 'http://ec2-18-136-200-224.ap-southeast-1.compute.amazonaws.com';
  final dio = Dio();

  Future<dynamic> classify(List<String> paths) async {
    final List files = [];

    for (final path in paths) {
      files.add(MultipartFile.fromFileSync(path));
    }

    final formData = FormData.fromMap({'files': files});

    final response = await dio.post(URL + '/classify/', data: formData);

    return response.data;
  }

  Future<dynamic> classifyUrl(List<String> urls) async {
    final List<Map<String, String>> urlMaps = [];

    for (final url in urls) {
      urlMaps.add({"source": url});
    }

    final response = await dio.post(URL + '/classify-url/', data: urlMaps);

    return response.data;
  }

  Future<dynamic> detect(List<String> paths) async {
    final List files = [];

    for (final path in paths) {
      files.add(MultipartFile.fromFileSync(path));
    }

    final formData = FormData.fromMap({'files': files});

    final response = await dio.post(URL + '/detect/', data: formData);

    return response.data;
  }

  Future<dynamic> detectUrl(List<String> urls) async {
    final List<Map<String, String>> urlMaps = [];

    for (final url in urls) {
      urlMaps.add({"source": url});
    }

    final response = await dio.post(URL + '/detect-url/', data: urlMaps);

    return response.data;
  }

  Future<dynamic> censor(List<String> paths) async {
    final List files = [];

    for (final path in paths) {
      files.add(MultipartFile.fromFileSync(path));
    }

    final formData = FormData.fromMap({'files': files});

    final response = await dio.post(URL + '/censor/', data: formData);

    return response.data;
  }

  Future<dynamic> censorUrl(List<String> urls) async {
    final List<Map<String, String>> urlMaps = [];

    for (final url in urls) {
      urlMaps.add({"source": url});
    }

    final response = await dio.post(URL + '/censor-url/', data: urlMaps);

    return response.data;
  }
}
