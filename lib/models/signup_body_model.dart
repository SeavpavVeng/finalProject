class SignUpBody {
  String username;
  //String location;
  String phone;
  String password;
  String confirmpassword;

  SignUpBody({
    required this.username,
    // required this.location,
    required this.phone,
    required this.password,
    required this.confirmpassword,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["username"] = this.username;
    //  data["location"] = thislocation;
    data["phone_number"] = this.phone;
    data["password"] = this.password;
    data["passsword_confirmation"] = this.confirmpassword;
    return data;
  }
}
