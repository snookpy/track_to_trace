import 'package:flutter/cupertino.dart';
import 'package:track_to_trace/models/tracking.dart';
import 'package:track_to_trace/services/thaipostapi_provider.dart';

class TrackingModel with ChangeNotifier {
  bool _isFetching = false;

  List<Tracking> trackings = [];

  bool get isFetching => _isFetching;

  Future<void> fetchTrackingByBarcode(String barcode) async {
    _isFetching = true;
    notifyListeners();
    ThaipostApiProvider t = ThaipostApiProvider();
    trackings = await t.getTrack(barcode);
    _isFetching = false;
    notifyListeners();
  }
}
