class ApiResponse {
  dynamic data;
  bool success;
  String message;

  ApiResponse({this.success=false, this.data, this.message = ""});
}
