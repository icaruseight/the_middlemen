///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
const String _jsonKeyDeleteShipmentData = 'data';
class DeleteShipment {
/*
{
  "data": "deleted"
}
*/

  String? data;
  Map<String, dynamic> __origJson = {};

  DeleteShipment({
    this.data,
  });
  DeleteShipment.fromJson(Map<String, dynamic> json) {
    __origJson = json;
    data = json[_jsonKeyDeleteShipmentData]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyDeleteShipmentData] = this.data;
    return data;
  }
  Map<String, dynamic> origJson() => __origJson;
}