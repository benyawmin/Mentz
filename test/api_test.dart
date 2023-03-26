import 'package:flutter_test/flutter_test.dart';
import 'package:mentz/src/resources/api_provider.dart';
import 'package:mentz/src/models/journey_model.dart';

void main() {
  group('ApiProvider', () {
    final apiProvider = ApiProvider();

    test('fetchSearchedResults returns List<Location>', () async {
      final result = await apiProvider.fetchSearchedResults('Munich');
      expect(result.isRight, true);
      expect(result.fold((_) => null, (locations) => locations), isA<List<Location>>());
    });

    test('fetchSearchedResults handles errors correctly', () async {
      final result = await apiProvider.fetchSearchedResults('');
      expect(result.isLeft, true);
      expect(result.fold((error) => error, (_) => null), isA<String>());
    });
  });
}
