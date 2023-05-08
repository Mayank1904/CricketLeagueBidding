import 'dart:convert';

class ApiResponse {
  final bool status;
  final String data;
  ApiResponse({
    required this.status,
    required this.data,
  });

  ApiResponse copyWith({
    bool? status,
    String? data,
  }) {
    return ApiResponse(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'data': data,
    };
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      status: map['status'] as bool,
      data: map['data'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromJson(String source) =>
      ApiResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ApiResponse(status: $status, data: $data)';

  @override
  bool operator ==(covariant ApiResponse other) {
    if (identical(this, other)) return true;

    return other.status == status && other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}
