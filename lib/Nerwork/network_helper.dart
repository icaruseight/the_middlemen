import 'dart:convert';
import 'dart:io';
import 'package:the_middlemen/Models/Customer%20Models/delete_shipment.dart';
import 'package:the_middlemen/Models/Customer%20Models/login.dart';
import 'package:http/http.dart' as http;
import 'package:the_middlemen/Models/Customer%20Models/pricing.dart';
import 'package:the_middlemen/Models/Customer%20Models/shipment.dart';
import 'package:the_middlemen/Models/Customer%20Models/signup.dart';
import 'package:the_middlemen/Models/Customer%20Models/view_shipment.dart';
import 'package:the_middlemen/Models/Driver%20Models/shipment_finish.dart';
import 'package:the_middlemen/Models/Driver%20Models/shipment_list.dart';
import 'package:the_middlemen/Models/Driver%20Models/shipment_update.dart';
import 'package:the_middlemen/Models/Customer Models/edit_profile.dart';

class NetworkHelper{
  final baseurl = 'http://10.0.2.2:8000';

  Future<dynamic> getDriverLoginData(
      String username,
      String password,
      ) async {
    var loginModel;
    print(username);
    var response = await http.post(
      Uri.parse('$baseurl/api/login/driver'),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode(<String, dynamic>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200){
      var data = response.body;
      var jsonMap = jsonDecode(data);
      print(data);
      print("login: $jsonMap");
      loginModel = Login.fromJson(jsonMap);
    }
    return loginModel;
  }

  Future<dynamic> getCusLoginData(
      String username,
      String password,
      ) async {
    var loginModel;
      var response = await http.post(
          Uri.parse('$baseurl/api/login/customer'),
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
          body: jsonEncode(<String, dynamic>{
            'username': username,
            'password': password,
          }),
      );
    if (response.statusCode == 200){
      var data = response.body;
      var jsonMap = jsonDecode(data);
      print("login: $jsonMap");
      loginModel = Login.fromJson(jsonMap);
    }
    return loginModel;
  }

  Future<dynamic> getCusSignUpData(
      String username,
      String email,
      String first_name,
      String last_name,
      String password,
      String phone
      ) async {
    var model;
    var response = await http.post(
      Uri.parse('$baseurl/api/register/customer'),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode(<String, dynamic>{
        'username': username,
        'email' : email,
        'first_name' : first_name,
        'last_name' : last_name,
        'phone': phone,
        'password': password,
      }),
    );
    if (response.statusCode == 200){
      var data = response.body;
      var jsonMap = jsonDecode(data);
      model = SignUp.fromJson(jsonMap);
    }
    return model;
  }

  Future<dynamic> getDriverSignUpData(
      String username,
      String email,
      String first_name,
      String last_name,
      String password,
      String phone,
      String license,
      String vehicle
      ) async {
    var Model;
    var response = await http.post(
      Uri.parse('$baseurl/api/register/driver'),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode(<String, dynamic>{
        'username': username,
        'email' : email,
        'first_name' : first_name,
        'last_name' : last_name,
        'password': password,
        'phone': phone,
        'license' : license,
        'vehicle_number' : vehicle
      }),
    );
    if (response.statusCode == 200){
      var data = response.body;
      var jsonMap = jsonDecode(data);
      Model = SignUp.fromJson(jsonMap);
    }
    return Model;
  }

  Future<dynamic> getPricingData() async {
    var pricing;
    var response = await http.get(
      Uri.parse('$baseurl/api/pricing'),
    );
    if (response.statusCode == 200){
      // List<Pricing> list = parseAgents(response.body);
      var data = response.body;

      var jsonMap = jsonDecode(data);
      pricing = Pricing.fromJson(jsonMap);
      return pricing;
    }
  }

  Future<dynamic> getViewShipmentData(String token) async {
    var ship;
    var response = await http.get(
      Uri.parse('$baseurl/api/shipmentView'),
      headers: {HttpHeaders.contentTypeHeader: "application/json",
        "Authorization" : "Token $token",
      },
    );
    if (response.statusCode == 200){
      var data = response.body;
      var jsonMap = jsonDecode(data);
      ship = ViewShipment.fromJson(jsonMap);
      return ship;
    }
  }

  Future<dynamic> getShipmentList(String token) async {
    var ship;
    var response = await http.get(
      Uri.parse('$baseurl/api/shipment'),
      headers: {HttpHeaders.contentTypeHeader: "application/json",
        "Authorization" : "Token $token",
      },
    );
    if (response.statusCode == 200){
      var data = response.body;
      var jsonMap = jsonDecode(data);
      ship = ShipmentList.fromJson(jsonMap);
      return ship;
    }
  }


  Future<dynamic> getShipmentData(
      String of_type,
      String weight,
      String size,
      String price,
      String receiver,
      String package_type,
      String phone_number,
      String start,
      String destination,
      String status,
      String payment_type,
      String email,
      String token,
      String deliveryDate
      ) async {
    var Model;
    var response = await http.post(
      Uri.parse('$baseurl/api/shipment'),
      headers: {HttpHeaders.contentTypeHeader: "application/json",
        "Authorization" : "Token $token",
      },
      body: jsonEncode(<String, dynamic>{
        "of_type" : of_type,
        "weight" : weight,
        "size" : size,
        "price" : price,
        "receiver" : receiver,
        "package_type" : package_type,
        "phone_number" : phone_number,
        "start" : start,
        "destination" : destination,
        "status" : 'Processing',
        "payment_type" : payment_type,
        "email" : email,
        "delivery_date" : deliveryDate
      }),
    );
    if (response.statusCode == 201 || response.statusCode == 200){
      var data = response.body;
      var jsonMap = jsonDecode(data);
      Model = Shipment.fromJson(jsonMap);
    }
    return Model;
  }

  Future<dynamic> updateCusProfile(
      String firstName,
      String lastName,
      String phone,
      String email,
      String token,
      String username
      ) async {
    var Model;
    var response = await http.post(
      Uri.parse('$baseurl/api/update/$username'),
      headers: {HttpHeaders.contentTypeHeader: "application/json",
        "Authorization" : "Token $token",
      },
      body: jsonEncode(<String, dynamic>{
        "first_name" : firstName,
        "last_name" : lastName,
        "phone" : phone,
        "email" : email,
      }),
    );
    if (response.statusCode == 201 || response.statusCode == 200){
      var data = response.body;
      var jsonMap = jsonDecode(data);
      Model = EditProfileModel.fromJson(jsonMap);
    }
    return Model;
  }

  Future<dynamic> shipmentUpdate(
      String trackingNumber,
      String token
      ) async {
    var Model;
    var response = await http.patch(
      Uri.parse('$baseurl/api/shipmentUpdate/$trackingNumber'),
      headers: {HttpHeaders.contentTypeHeader: "application/json",
        "Authorization" : "Token $token",
      },
      body: jsonEncode(<String, dynamic>{
        'tracking_number': trackingNumber,
      }),
    );
    if (response.statusCode == 200){
      var data = response.body;
      var jsonMap = jsonDecode(data);
      Model = ShipmentUpdate.fromJson(jsonMap);
    }
    return Model;
  }

  Future<dynamic> shipmentFinish(
      String trackingNumber,
      String token
      ) async {
    var Model;
    var response = await http.patch(
      Uri.parse('$baseurl/api/shipmentFinish/$trackingNumber'),
      headers: {HttpHeaders.contentTypeHeader: "application/json",
        "Authorization" : "Token $token",
      },
      body: jsonEncode(<String, dynamic>{
        'tracking_number': trackingNumber,
      }),
    );
    if (response.statusCode == 200){
      var data = response.body;
      var jsonMap = jsonDecode(data);
      Model = ShipmentFinish.fromJson(jsonMap);
    }
    return Model;
  }

  Future<dynamic> shipmentDelete(
      String trackingNumber,
      String token
      ) async {
    var Model;
    var response = await http.delete(
      Uri.parse('$baseurl/api/shipmentDelete/$trackingNumber'),
      headers: {HttpHeaders.contentTypeHeader: "application/json",
        "Authorization" : "Token $token",
      },
      body: jsonEncode(<String, dynamic>{
        'tracking_number': trackingNumber,
      }),
    );
    if (response.statusCode == 200){
      var data = response.body;
      var jsonMap = jsonDecode(data);
      Model = DeleteShipment.fromJson(jsonMap);
    }
    return Model;
  }
}





