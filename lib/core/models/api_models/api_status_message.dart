class ApiStatusMessageModel{
      bool? status;
      String? message;
      ApiStatusMessageModel({this.status,this.message});
      factory ApiStatusMessageModel.fromJson(Map<String, dynamic> json) =>  ApiStatusMessageModel(
        status: json["status"],
        message: getString(json["message"]),
    );

    static String getString(data){
          if(data!=null){
              return data.toString();
            }
          else{
              return "";
            }  
      } 

  }