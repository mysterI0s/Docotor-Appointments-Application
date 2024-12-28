class LoginModel {
  LoginModel({
    required this.message,
    required this.mess,
    required this.accessToken,
    required this.tokenType,
  });

  final String? message;
  final String? mess;
  final String? accessToken;
  final String? tokenType;

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json["message"],
      mess: json["mess"],
      accessToken: json["access_token"],
      tokenType: json["token_type"],
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "mess": mess,
        "access_token": accessToken,
        "token_type": tokenType,
      };
}
