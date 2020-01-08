class Package {
  final String packageName;
  final String snNumber;
  int id;

  Package({this.packageName, this.snNumber, this.id});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'snNumber': snNumber,
      'packageName': packageName,
    };
    return map;
  }

  factory Package.fromMap(Map<String, dynamic> map) => new Package(
        snNumber: map['snNumber'],
        packageName: map['packageName'],
      );
}
