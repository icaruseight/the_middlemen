///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
const String _jsonKeyViewShipmentData = 'data';
const String _jsonKeyViewShipmentDataId = 'id';
const String _jsonKeyViewShipmentDataOfType = 'of_type';
const String _jsonKeyViewShipmentDataWeight = 'weight';
const String _jsonKeyViewShipmentDataSize = 'size';
const String _jsonKeyViewShipmentDataPrice = 'price';
const String _jsonKeyViewShipmentDataReceiver = 'receiver';
const String _jsonKeyViewShipmentDataPhoneNumber = 'phone_number';
const String _jsonKeyViewShipmentDataPackageType = 'package_type';
const String _jsonKeyViewShipmentDataStart = 'start';
const String _jsonKeyViewShipmentDataDestination = 'destination';
const String _jsonKeyViewShipmentDataStatus = 'status';
const String _jsonKeyViewShipmentDataEmail = 'email';
const String _jsonKeyViewShipmentDataPaymentType = 'payment_type';
const String _jsonKeyViewShipmentDataTrackingNumber = 'tracking_number';
class ViewShipmentData {
/*
{
  "id": 35,
  "of_type": "parcel",
  "weight": "20-49 kg",
  "size": "10-15 m",
  "price": "2040",
  "receiver": "Kuki",
  "phone_number": "9841252275",
  "package_type": "Cheap",
  "start": "M8P5+P8F, Lalitpur, 44600, Nepal",
  "destination": "Labim Mall",
  "status": "Processing",
  "email": "kuki@gmail.com",
  "payment_type": "Khalti",
  "tracking_number": "e1f83353-d6c9-4f0a-8667-599bf1e2c227"
}
*/

  String? id;
  String? ofType;
  String? weight;
  String? size;
  String? price;
  String? receiver;
  String? phoneNumber;
  String? packageType;
  String? start;
  String? destination;
  String? status;
  String? email;
  String? paymentType;
  String? trackingNumber;
  Map<String, dynamic> __origJson = {};

  ViewShipmentData({
    this.id,
    this.ofType,
    this.weight,
    this.size,
    this.price,
    this.receiver,
    this.phoneNumber,
    this.packageType,
    this.start,
    this.destination,
    this.status,
    this.email,
    this.paymentType,
    this.trackingNumber,
  });
  ViewShipmentData.fromJson(Map<String, dynamic> json) {
    __origJson = json;
    id = json[_jsonKeyViewShipmentDataId]?.toString();
    ofType = json[_jsonKeyViewShipmentDataOfType]?.toString();
    weight = json[_jsonKeyViewShipmentDataWeight]?.toString();
    size = json[_jsonKeyViewShipmentDataSize]?.toString();
    price = json[_jsonKeyViewShipmentDataPrice]?.toString();
    receiver = json[_jsonKeyViewShipmentDataReceiver]?.toString();
    phoneNumber = json[_jsonKeyViewShipmentDataPhoneNumber]?.toString();
    packageType = json[_jsonKeyViewShipmentDataPackageType]?.toString();
    start = json[_jsonKeyViewShipmentDataStart]?.toString();
    destination = json[_jsonKeyViewShipmentDataDestination]?.toString();
    status = json[_jsonKeyViewShipmentDataStatus]?.toString();
    email = json[_jsonKeyViewShipmentDataEmail]?.toString();
    paymentType = json[_jsonKeyViewShipmentDataPaymentType]?.toString();
    trackingNumber = json[_jsonKeyViewShipmentDataTrackingNumber]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyViewShipmentDataId] = id;
    data[_jsonKeyViewShipmentDataOfType] = ofType;
    data[_jsonKeyViewShipmentDataWeight] = weight;
    data[_jsonKeyViewShipmentDataSize] = size;
    data[_jsonKeyViewShipmentDataPrice] = price;
    data[_jsonKeyViewShipmentDataReceiver] = receiver;
    data[_jsonKeyViewShipmentDataPhoneNumber] = phoneNumber;
    data[_jsonKeyViewShipmentDataPackageType] = packageType;
    data[_jsonKeyViewShipmentDataStart] = start;
    data[_jsonKeyViewShipmentDataDestination] = destination;
    data[_jsonKeyViewShipmentDataStatus] = status;
    data[_jsonKeyViewShipmentDataEmail] = email;
    data[_jsonKeyViewShipmentDataPaymentType] = paymentType;
    data[_jsonKeyViewShipmentDataTrackingNumber] = trackingNumber;
    return data;
  }
  Map<String, dynamic> origJson() => __origJson;
}

class ViewShipment {
/*
{
  "data": [
    {
      "id": 35,
      "of_type": "parcel",
      "weight": "20-49 kg",
      "size": "10-15 m",
      "price": "2040",
      "receiver": "Kuki",
      "phone_number": "9841252275",
      "package_type": "Cheap",
      "start": "M8P5+P8F, Lalitpur, 44600, Nepal",
      "destination": "Labim Mall",
      "status": "Processing",
      "email": "kuki@gmail.com",
      "payment_type": "Khalti",
      "tracking_number": "e1f83353-d6c9-4f0a-8667-599bf1e2c227"
    }
  ]
}
*/

  List<ViewShipmentData?>? data;
  Map<String, dynamic> __origJson = {};

  ViewShipment({
    this.data,
  });
  ViewShipment.fromJson(Map<String, dynamic> json) {
    __origJson = json;
    if (json[_jsonKeyViewShipmentData] != null) {
      final v = json[_jsonKeyViewShipmentData];
      final arr0 = <ViewShipmentData>[];
      v.forEach((v) {
        arr0.add(ViewShipmentData.fromJson(v));
      });
      this.data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data[_jsonKeyViewShipmentData] = arr0;
    }
    return data;
  }
  Map<String, dynamic> origJson() => __origJson;
}
