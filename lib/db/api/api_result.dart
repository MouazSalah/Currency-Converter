class ApiResult {
  final bool isSuccess;
  final String message;

  ApiResult.success(this.message) : isSuccess = true;
  ApiResult.failure(this.message) : isSuccess = false;
}
