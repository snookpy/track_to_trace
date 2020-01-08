import 'dart:convert';

import 'package:track_to_trace/config.dart';
import 'package:http/http.dart' as http;
import 'package:track_to_trace/models/tracking.dart';

class ThaipostApiProvider {
  final String secretToken = Config.thaiPostApiKey;

  final String baseUrl = 'https://trackapi.thailandpost.co.th/post/api/v1';

  String token = "";

  // TODO: refactor to use Date
  String expDate;

  static final ThaipostApiProvider _singleton = ThaipostApiProvider._internal();

  factory ThaipostApiProvider() {
    return _singleton;
  }

  ThaipostApiProvider._internal();

  Future<void> getToken() async {
    var getTokenUrl = baseUrl + "/authenticate/token";
    var res = await http.post(
      getTokenUrl,
      headers: {
        'content-type': 'application/json',
        'Authorization': 'Token $secretToken'
      },
    );
    Map<String, dynamic> tokenReturn = jsonDecode(res.body);
    expDate = tokenReturn['expire'];
    token = tokenReturn['token'];
    print(tokenReturn);
  }

  Future<List<Tracking>> getTrack(barcode) async {
    Map<String, dynamic> test = {
      "response": {
        "items": {
          "LO423098627CN": [
            {
              "barcode": "LO423098627CN",
              "status": "103",
              "status_description": "รับฝาก",
              "status_date": "13/11/2562 19:57:00+07:00",
              "location": "ต่างประเทศ (จีน)",
              "postcode": "99999",
              "delivery_status": null,
              "delivery_description": null,
              "delivery_datetime": null,
              "receiver_name": null,
              "signature": null
            },
            {
              "barcode": "LO423098627CN",
              "status": "204",
              "status_description": "ถึงที่ทำการแลกปลี่ยนระหว่างประเทศขาออก",
              "status_date": "19/11/2562 13:18:00+07:00",
              "location": "ต่างประเทศ (จีน)",
              "postcode": "99999",
              "delivery_status": null,
              "delivery_description": null,
              "delivery_datetime": null,
              "receiver_name": null,
              "signature": null
            },
            {
              "barcode": "LO423098627CN",
              "status": "201",
              "status_description": "อยู่ระหว่างการขนส่ง",
              "status_date": "19/11/2562 17:05:00+07:00",
              "location": "ต่างประเทศ (จีน)",
              "postcode": "99999",
              "delivery_status": null,
              "delivery_description": null,
              "delivery_datetime": null,
              "receiver_name": null,
              "signature": null
            },
            {
              "barcode": "LO423098627CN",
              "status": "205",
              "status_description": "ถึงที่ทำการแลกปลี่ยนระหว่างประเทศขาเข้า",
              "status_date": "22/11/2562 10:07:07+07:00",
              "location": "ศป.หลักสี่",
              "postcode": "10010",
              "delivery_status": null,
              "delivery_description": null,
              "delivery_datetime": null,
              "receiver_name": null,
              "signature": null
            },
            {
              "barcode": "LO423098627CN",
              "status": "201",
              "status_description": "อยู่ระหว่างการขนส่ง",
              "status_date": "22/11/2562 13:23:06+07:00",
              "location": "ศป.หลักสี่",
              "postcode": "10010",
              "delivery_status": null,
              "delivery_description": null,
              "delivery_datetime": null,
              "receiver_name": null,
              "signature": null
            },
            {
              "barcode": "LO423098627CN",
              "status": "201",
              "status_description": "อยู่ระหว่างการขนส่ง",
              "status_date": "23/11/2562 19:35:42+07:00",
              "location": "ศป.ลำพูน",
              "postcode": "51010",
              "delivery_status": null,
              "delivery_description": null,
              "delivery_datetime": null,
              "receiver_name": null,
              "signature": null
            },
            {
              "barcode": "LO423098627CN",
              "status": "201",
              "status_description": "อยู่ระหว่างการขนส่ง",
              "status_date": "24/11/2562 22:37:07+07:00",
              "location": "ศป.ลำพูน",
              "postcode": "51010",
              "delivery_status": null,
              "delivery_description": null,
              "delivery_datetime": null,
              "receiver_name": null,
              "signature": null
            },
            {
              "barcode": "LO423098627CN",
              "status": "301",
              "status_description": "อยู่ระหว่างการนำจ่าย",
              "status_date": "25/11/2562 09:59:56+07:00",
              "location": "เชียงใหม่",
              "postcode": "50000",
              "delivery_status": null,
              "delivery_description": null,
              "delivery_datetime": null,
              "receiver_name": null,
              "signature": null
            },
            {
              "barcode": "LO423098627CN",
              "status": "501",
              "status_description": "นำจ่ายสำเร็จ",
              "status_date": "25/11/2562 11:36:16+07:00",
              "location": "เชียงใหม่",
              "postcode": "50000",
              "delivery_status": "S",
              "delivery_description": "ผู้รับได้รับสิ่งของเรียบร้อยแล้ว",
              "delivery_datetime": "25/11/2562 11:36:16+07:00",
              "receiver_name": "ริมน้ำแมนชั่น  ผู้จัดการริมน้ำ/ผู้รับรับเอง",
              "signature":
                  "https://trackimage.thailandpost.co.th/f/signature/QDk4NjI3YjVzMGx1VDMz/QGI1c0xPMGx1VDMx/QGI1czBsQ051VDM0/QGI1czBsdTQyMzBUMzI="
            }
          ]
        },
        "track_count": {
          "track_date": "08/01/2563",
          "count_number": 12,
          "track_count_limit": 1000
        }
      },
      "message": "successful",
      "status": true
    };
    // // TODO: will change the logic to use expDate
    // if (token.isEmpty) {
    //   await getToken();
    // }

    // var getTokenUrl = baseUrl + "/track";

    // var res = await http.post(getTokenUrl,
    //     headers: {
    //       'Content-Type': 'application/json',
    //       'Authorization': 'Token $token'
    //     },
    //     body: json.encode({
    //       "status": "all",
    //       "language": "TH",
    //       "barcode": [barcode]
    //     }));

    // Map<String, dynamic> trackingReturns = jsonDecode(test);

    await Future.delayed(const Duration(milliseconds: 2500));
    List<Tracking> trackingList =
        test['response']['items'][barcode].map<Tracking>((eachT) {
          return Tracking.fromJson(eachT);
        }).toList().reversed.toList();
    
    return trackingList;
  }
}
