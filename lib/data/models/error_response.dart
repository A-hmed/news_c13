class ErrorResponse {
  ErrorResponse({
    this.status,
    this.code,
    this.message,
  });

  ErrorResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }

  String? status;
  String? code;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;
    return map;
  }
}
