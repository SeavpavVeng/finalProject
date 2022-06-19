class ResponseModel {
  bool isSuccess;
  String isMessage;

  ResponseModel(this.isSuccess, this.isMessage);

  String get message => isMessage;
  bool get  success => isSuccess;
}
