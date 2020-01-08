import 'dart:convert';

import 'package:track_to_trace/config.dart';
import 'package:http/http.dart' as http;

class ThaipostApiProvider {
  final String secretToken = Config.thaiPostApiKey;

  final String baseUrl = 'https://trackapi.thailandpost.co.th/post/api/v1';

  Future<void> getToken() async {
    var getTokenUrl = baseUrl + "/authenticate/token";
    var res = await http.post(
      getTokenUrl,
      headers: {
        'content-type': 'application/json',
        'Authorization': 'Token $secretToken'
      },
    );
    
    print(res);
  }

  Future<void> getTrack(barcode) async {
    var getTokenUrl = baseUrl + "/track";

    var res = await http.post(
      getTokenUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzZWN1cmUtYXBpIiwiYXVkIjoic2VjdXJlLWFwcCIsInN1YiI6IkF1dGhvcml6YXRpb24iLCJleHAiOjE1ODExNTQ4MjIsInJvbCI6WyJST0xFX1VTRVIiXSwiZCpzaWciOnsicCI6InpXNzB4IiwicyI6bnVsbCwidSI6ImZkZDRlMDhjODAzYWI3ZmM1MWU1MmUyOTNiNTQyMjEyIiwiZiI6InhzeiM5In19.LWuNgomjegnAjNymesxUoyuHSPPeLY0BROt3QE6Wm2kizaiNR_-Rj89BJqqP0zaVy75xvZjaUsIfJPcDr6Bl8A'
      },

      body: json.encode({
        "status": "all",
	      "language": "TH",
        "barcode": [barcode]
      })
    );

    print(res);
  }
}
