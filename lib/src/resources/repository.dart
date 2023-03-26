// Repository pattern to simplify the Application Layer
// (Can be useful if the Application Layer gets more complicated)
import 'package:either_dart/src/either.dart';
import 'package:mentz/src/models/journey_model.dart';

import 'api_provider.dart';

class Repository {
  //Fetching searched results from repository
  Future<Either<String, List<Location>>> fetchSearchedResults(String searchedText) async {
    return await ApiProvider().fetchSearchedResults(searchedText);
  }
}