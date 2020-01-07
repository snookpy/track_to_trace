import 'package:flutter/cupertino.dart';
import 'package:track_to_trace/models/package.dart';
import 'package:track_to_trace/services/sqlite_provider.dart';

class PackageModel with ChangeNotifier {
  bool _isFetching = false;

  bool get isFetching => _isFetching;
  List<Package> packages = [];

  Future<void> getPackages() async {
    _isFetching = true;
    packages = await SqliteProvider.db.getAllPackage();
    _isFetching = false;
  }
}
