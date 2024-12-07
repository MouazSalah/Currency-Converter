// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:contactcars_app_retail/modules/lookups/domain/entities/currency.dart';
import 'package:hive/hive.dart';

import 'package:contactcars_app_retail/db/hive/lookups_type_id.dart';

@HiveType(typeId: HiveTypeId.currencyTypeId) // Unique typeId for Currency
class CurrencyResponse {
  @HiveField(0)
  final Map<String, Currency> results;

  CurrencyResponse({
    required this.results,
  });

  bool get isResultsEmpty => results.isEmpty;

  /// Factory constructor to create a CurrencyResponse from JSON.
  factory CurrencyResponse.fromJson(Map<String, dynamic> json) {
    final resultsJson = json['results'] as Map<String, dynamic>;
    final Map<String, Currency> results = resultsJson.map(
      (key, value) => MapEntry(key, Currency.fromJson(value)),
    );
    return CurrencyResponse(results: results);
  }

  /// Converts the CurrencyResponse to JSON.
  Map<String, dynamic> toJson() {
    return {
      'results': results.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}
