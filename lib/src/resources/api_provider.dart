import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mentz/src/models/journey_model.dart';

class ApiProvider {
  final String baseUrl = 'mvvvip1.defas-fgi.de';

  // Fetching searched text
  Future<Either<String, List<Location>>> fetchSearchedResults(String searchedText) async {
    final queryParameters = {
      'language': 'en',
      'outputFormat': 'RapidJSON',
      'type_sf': 'any',
      'name_sf': '{$searchedText}',
    };

    final Uri uri = Uri.https(baseUrl, '/mvv/XML_STOPFINDER_REQUEST', queryParameters);

    // Using Either package to handle request errors
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final items = json.decode(utf8.decode(response.bodyBytes));
        JourneyModel journeyModel = JourneyModel.fromJson(items);
        return Right(journeyModel.locations);
      } else {
        return Left('Error: ${response.statusCode}');
      }
    } catch (error) {
      return Left('Error: $error');
    }
  }
}
