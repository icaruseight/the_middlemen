import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  var fName, lName, phoneNumber;
  late bool isCustomer;
  var license;
  var vehicle;
  late var parcelType;
  var weightT;
  var sizeT;
  var dist;
  var pacType;
  var startAd,destAd;
  var reName,rePhone,reEmail;
  var token;
  var date;
  var Email;
  var username;

  void firstName(var firstName) {
    fName = firstName;
    notifyListeners();
  }

  void lastName(var lastName) {
    lName = lastName;
    notifyListeners();
  }

  void email(var email){
    Email = email;
    notifyListeners();
  }

  void pNumber(var pNumber) {
    phoneNumber = pNumber;
    notifyListeners();
  }

  void isCus(var isCus) {
    isCustomer = isCus;
    notifyListeners();
  }

  void licenseN(var licenseN, var vehicleN){
    license = licenseN;
    vehicle = vehicleN;
    notifyListeners();
  }

  void partype(var partype, var weight, var dimweight){
    parcelType = partype;
    weightT = weight;
    sizeT = dimweight;
    notifyListeners();
  }

  void distance(var distance){
    dist = distance;
    notifyListeners();
  }

  void packageType(var packageType){
    pacType = packageType;
    notifyListeners();
  }

  void startDest(var start,var dest){
    startAd = start;
    destAd = dest;
    notifyListeners();
  }

  void receiverInfo(var rname,var rphone, remail){
    reName = rname;
    rePhone = rphone;
    reEmail = remail;
    notifyListeners();
  }

  void tokenCus(var tokenCus){
    token = tokenCus;
    notifyListeners();
  }

  void deliveryDate(var date){
    this.date = date;
    notifyListeners();
  }
  void userName(var uName){
    this.username = uName;
    notifyListeners();
  }
}
