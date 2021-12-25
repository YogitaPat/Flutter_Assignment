

class LoginResponse {

  final String message;

  bool success = true;
  final String error;

  LoginResponse({required this.message, required this.success, required this.error,
  });



  factory LoginResponse.fromJson(Map<String, dynamic> json) {

    var jsondata = json;
    if(!jsondata.containsKey("success"))

    {
      jsondata["success"]= true;
    }


    return LoginResponse(
        message: json["message"],
        success: json["success"],
        error: json["error"],


    );
  }

}