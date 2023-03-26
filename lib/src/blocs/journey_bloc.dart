// BLoC pattern is used as the state management
// EVENT && STATE approach could also be used here for BLoC

import 'package:either_dart/src/either.dart';
import 'package:mentz/src/models/journey_model.dart';
import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';

class JourneyBloc {
  final _repository = Repository();

  final _searchedResults = PublishSubject();

  get searchedResultsStream => _searchedResults.stream;

  //Fetching searched results
  void fetchSearchedResults(searchedText) async {
    Either<String, List<Location>> searchedResults;
    searchedResults = await _repository.fetchSearchedResults(searchedText);
    searchedResults.fold((left) => _searchedResults.sink.addError(left),
        (right) {
      _searchedResults.sink.add(right);
    });
  }

  dispose() {
    _searchedResults.close();
  }
}

// Creating a BLoC object for usage in the whole app
final jBloc = JourneyBloc();
