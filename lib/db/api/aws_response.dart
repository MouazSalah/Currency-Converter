import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AwsImageResponse {
  bool? Result;
  int? status;
  String? statusDescription;
  String? logDescription;
  AwsImageResponse({
    this.Result,
    this.status,
    this.statusDescription,
    this.logDescription,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Result': Result,
      'status': status,
      'statusDescription': statusDescription,
      'logDescription': logDescription,
    };
  }

  factory AwsImageResponse.fromMap(Map<String, dynamic> map) {
    return AwsImageResponse(
      Result: map['Result'] != null ? map['Result'] as bool : null,
      status: map['status'] != null ? map['status'] as int : null,
      statusDescription: map['statusDescription'] != null
          ? map['statusDescription'] as String
          : null,
      logDescription: map['logDescription'] != null
          ? map['logDescription'] as String
          : null,
    );
  }

  @override
  String toString() {
    return 'AwsImageResponse(Result: $Result, status: $status, statusDescription: $statusDescription, logDescription: $logDescription)';
  }
}
