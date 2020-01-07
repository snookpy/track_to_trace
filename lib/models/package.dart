class Package {
  final String packageName;
  final String snNumber;

  Package({
    this.packageName,
    this.snNumber,
  });

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
