import 'package:flutter/cupertino.dart';
import 'package:track_to_trace/models/package.dart';
import 'package:track_to_trace/services/sqlite_provider.dart';

class PackageModel with ChangeNotifier {
  bool _isFetching = false;

  bool get isFetching => _isFetching;
  List<Package> packages = [];

  Future<void> getPackages() async {
    _isFetching = true;
    notifyListeners();
    packages = await SqliteProvider.db.getAllPackage();
    _isFetching = false;
    notifyListeners();
  }

  Future<void> addPackage(Package newPackage) async {
    _isFetching = true;
    notifyListeners();
    var id = await SqliteProvider.db.newPackage(newPackage);
    newPackage.id = id;
    packages.insert(0, newPackage);
    _isFetching = false;
    notifyListeners();
  }

  Future<void> cleanPackage() async {
    await SqliteProvider.db.cleanPackage();
  }
}
