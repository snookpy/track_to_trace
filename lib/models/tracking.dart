class Tracking {
  final String barcode;
  final String status;
  final String statusDescription;
  final String statusDate;
  final String location;
  final String postcode;
  final String deliveryStatus;
  final String deliveryDescription;
  final String deliveryDatetime;
  final String receiverName;
  final String signature;

  Tracking(
      {this.location,
      this.barcode,
      this.deliveryDatetime,
      this.deliveryDescription,
      this.deliveryStatus,
      this.postcode,
      this.receiverName,
      this.signature,
      this.status,
      this.statusDate,
      this.statusDescription});

  Tracking.fromJson(Map<String, dynamic> json)
      : location = json['location'],
        barcode = json['barcode'],
        deliveryDatetime = json['delivery_datetime'],
        deliveryDescription = json['delivery_description'],
        deliveryStatus = json['delivery_status'],
        postcode = json['postcode'],
        receiverName = json['receiver_name'],
        signature = json['signature'],
        status = json['status'],
        statusDate = json['status_date'],
        statusDescription = json['status_descriptio'];
}
