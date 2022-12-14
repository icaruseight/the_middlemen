///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
const String _jsonKeyLoginData = 'data';
const String _jsonKeyLoginDataExpiry = 'expiry';
const String _jsonKeyLoginDataToken = 'token';
const String _jsonKeyLoginDataUser = 'user';
const String _jsonKeyLoginDataUserUsername = 'username';
const String _jsonKeyLoginDataUserPhone = 'phone';
const String _jsonKeyLoginDataUserFirstName = 'first_name';
const String _jsonKeyLoginDataUserLastName = 'last_name';
const String _jsonKeyLoginDataUserEmail = 'email';
const String _jsonKeyLoginDataUserVehicleNumber = 'vehicle_number';
const String _jsonKeyLoginDataUserLicense = 'license';
class LoginDataUser {
/*
{
  "username": "test20",
  "phone": "9808790371",
  "first_name": "Abhinav",
  "last_name": "Dali",
  "email": "admin232@gmail.com",
  "vehicle_number": null,
  "license": null
}
*/

  String? username;
  String? phone;
  String? firstName;
  String? lastName;
  String? email;
  String? vehicleNumber;
  String? license;
  Map<String, dynamic> __origJson = {};

  LoginDataUser({
    this.username,
    this.phone,
    this.firstName,
    this.lastName,
    this.email,
    this.vehicleNumber,
    this.license,
  });
  LoginDataUser.fromJson(Map<String, dynamic> json) {
    __origJson = json;
    username = json[_jsonKeyLoginDataUserUsername]?.toString();
    phone = json[_jsonKeyLoginDataUserPhone]?.toString();
    firstName = json[_jsonKeyLoginDataUserFirstName]?.toString();
    lastName = json[_jsonKeyLoginDataUserLastName]?.toString();
    email = json[_jsonKeyLoginDataUserEmail]?.toString();
    vehicleNumber = json[_jsonKeyLoginDataUserVehicleNumber]?.toString();
    license = json[_jsonKeyLoginDataUserLicense]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyLoginDataUserUsername] = username;
    data[_jsonKeyLoginDataUserPhone] = phone;
    data[_jsonKeyLoginDataUserFirstName] = firstName;
    data[_jsonKeyLoginDataUserLastName] = lastName;
    data[_jsonKeyLoginDataUserEmail] = email;
    data[_jsonKeyLoginDataUserVehicleNumber] = vehicleNumber;
    data[_jsonKeyLoginDataUserLicense] = license;
    return data;
  }
  Map<String, dynamic> origJson() => __origJson;
}

class LoginData {
/*
{
  "expiry": "2022-03-09T20:14:40.116201Z",
  "token": "32fa42c7df1089cf95105193be90f83999e17f80a774b7836516e0f6cd4c63e2",
  "user": [
    [
      {
        "username": "test20",
        "phone": "9808790371",
        "first_name": "Abhinav",
        "last_name": "Dali",
        "email": "admin232@gmail.com",
        "vehicle_number": null,
        "license": null
      }
    ]
  ]
}
*/

  String? expiry;
  String? token;
  List<List<LoginDataUser?>?>? user;
  Map<String, dynamic> __origJson = {};

  LoginData({
    this.expiry,
    this.token,
    this.user,
  });
  LoginData.fromJson(Map<String, dynamic> json) {
    __origJson = json;
    expiry = json[_jsonKeyLoginDataExpiry]?.toString();
    token = json[_jsonKeyLoginDataToken]?.toString();
    if (json[_jsonKeyLoginDataUser] != null && (json[_jsonKeyLoginDataUser] is List)) {
      final v = json[_jsonKeyLoginDataUser];
      final arr0 = <List<LoginDataUser>>[];
      v.forEach((v) {
        final arr1 = <LoginDataUser>[];
        v.forEach((v) {
          arr1.add(LoginDataUser.fromJson(v));
        });
        arr0.add(arr1);
      });
      user = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyLoginDataExpiry] = expiry;
    data[_jsonKeyLoginDataToken] = token;
    if (user != null) {
      final v = user;
      final arr0 = [];
      v!.forEach((v) {
        final arr1 = [];
        v!.forEach((v) {
          arr1.add(v!.toJson());
        });
        arr0.add(arr1);
      });
      data[_jsonKeyLoginDataUser] = arr0;
    }
    return data;
  }
  Map<String, dynamic> origJson() => __origJson;
}

class Login {
/*
{
  "data": {
    "expiry": "2022-03-09T20:14:40.116201Z",
    "token": "32fa42c7df1089cf95105193be90f83999e17f80a774b7836516e0f6cd4c63e2",
    "user": [
      [
        {
          "username": "test20",
          "phone": "9808790371",
          "first_name": "Abhinav",
          "last_name": "Dali",
          "email": "admin232@gmail.com",
          "vehicle_number": null,
          "license": null
        }
      ]
    ]
  }
}
*/

  LoginData? data;
  Map<String, dynamic> __origJson = {};

  Login({
    this.data,
  });
  Login.fromJson(Map<String, dynamic> json) {
    __origJson = json;
    data = (json[_jsonKeyLoginData] != null && (json[_jsonKeyLoginData] is Map)) ? LoginData.fromJson(json[_jsonKeyLoginData]) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data[_jsonKeyLoginData] = this.data!.toJson();
    }
    return data;
  }
  Map<String, dynamic> origJson() => __origJson;
}
