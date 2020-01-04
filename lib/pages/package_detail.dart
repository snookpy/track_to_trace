import 'package:flutter/cupertino.dart';

class PackageDetail extends StatefulWidget {
  final String title;
  PackageDetail({this.title});

  @override
  _PackageDetailState createState() => _PackageDetailState();
}

class _PackageDetailState extends State<PackageDetail> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Login to T T T'),
      ),
      child: SafeArea(
        child: Container(
          child: Text("testing ${widget.title}"),
        ),
      ),
    );
  }
}
