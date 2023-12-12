class ApiResult<T> {
  T data;
  String? message;
  ApiResult(this.data, {this.message});

  bool get dataIsNotNull {
    return data != null;
  }

  bool get messageIsNotNull {
    return message != null;
  }
}
