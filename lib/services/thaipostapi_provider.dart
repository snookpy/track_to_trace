import 'dart:convert';

import 'package:track_to_trace/config.dart';
import 'package:http/http.dart' as http;
import 'package:track_to_trace/models/tracking.dart';

class ThaipostApiProvider {
  final String secretToken = Config.thaiPostApiKey;

  final String baseUrl = 'https://trackapi.thailandpost.co.th/post/api/v1';

  ThaipostApiProvider._();

  static final ThaipostApiProvider db = ThaipostApiProvider._();

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
  }

  Future<List<Tracking>> getTrack(barcode) async {
    // TODO: will change the logic to use expDate
    if (token.isEmpty) {
      await getToken();
    }

    var getTokenUrl = baseUrl + "/track";

    var res = await http.post(getTokenUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token'
        },
        body: json.encode({
          "status": "all",
          "language": "TH",
          "barcode": [barcode]
        }));

    Map<String, dynamic> trackingReturns = jsonDecode(res.body);

    List<Tracking> trackingList =
        trackingReturns['response']['items'][barcode].map<Tracking>((eachT) {
          return Tracking.fromJson(eachT);
        }).toList().reversed.toList();
    
    return trackingList;
  }
}
