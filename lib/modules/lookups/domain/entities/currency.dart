// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'package:contactcars_app_retail/db/hive/lookups_type_id.dart';

part 'currency.g.dart';

@HiveType(typeId: HiveTypeId.currencyTypeId) // Unique typeId for Currency
class Currency {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? currencyName;

  @HiveField(2)
  String? currencySymbol;

  Currency({
    this.id,
    this.currencyName,
    this.currencySymbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      id: json['id'],
      currencyName: json['currencyName'],
      currencySymbol: json['currencySymbol'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "currencyName": currencyName,
      "currencySymbol": currencySymbol,
    };
  }

  factory Currency.fromMap(Map<String, dynamic> json) => Currency(
        id: json['id'],
        currencyName: json['currencyName'],
        currencySymbol: json['currencySymbol'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "currencyName": currencyName,
        "currencySymbol": currencySymbol,
      };

  @override
  String toString() {
    return 'Currency(id: $id, currencyName: $currencyName, currencySymbol: $currencySymbol)';
  }
}