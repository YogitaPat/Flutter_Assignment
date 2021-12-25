

class LogoutResponse {

  final String? message;
  final String? status;


  LogoutResponse({ this.message,this.status
  });



  factory LogoutResponse.fromJson(Map<String, dynamic> json) {

    return LogoutResponse(

      message: json["message"],
      status: json["status"]
    );

  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;

    return data;
  }

}