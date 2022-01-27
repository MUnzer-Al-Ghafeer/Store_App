
class User{
  // int? _id;
  String? _username;
  String? _password;

  User(
      // this._id,
      this._username,
      this._password
      );

  User.map(dynamic obj){
    // this._id = obj['id'];
    this._username = obj['username'];
    this._password = obj['password'];
  }

  // int? get id => _id;

  String? get username => _username;

  String? get password => _password;

  Map<String, dynamic> toMap() {
    var map = new  Map<String,dynamic>();
    map["userName"] = this._username;
    map["userPassword"] = this._password;
    // if(_id != null ){map["id"] = this._id;}
    return map ;

  }

  User.fromMap(Map<String, dynamic> json) {
    this._username =  json["userName"];
    this._password =  json["userPassword"];
    // this._id = json["id"];
  }

}