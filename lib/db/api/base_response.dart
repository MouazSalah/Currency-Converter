class BaseResponse {
  int status;
  String statusDescription;
  String logDescription;
  String messageKey;
  dynamic result;

  BaseResponse({
    required this.status,
    required this.statusDescription,
    required this.logDescription,
    required this.messageKey,
    required this.result,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      status: json['status'] ?? 0,
      statusDescription: json['statusDescription'] ?? '',
      logDescription: json['logDescription'] ?? '',
      messageKey: json['messageKey'] ?? '',
      result: json['result'],
    );
  }
}
