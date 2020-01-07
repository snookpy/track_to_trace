import 'package:flutter/cupertino.dart';
import 'package:track_to_trace/models/package.dart';
import 'package:track_to_trace/widgets/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var package = new Package(
      packageName: "Bad Bag",
      snNumber: "sn4432202"
    );
    
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Shipped Pack'),
      ),
      child: SafeArea(
        child: CupertinoScrollbar(
          child: ListView(
            children: <Widget>[
              ProductRowItem(
                package: package,
              ),
              ProductRowItem(
                package: package,
              ),
              ProductRowItem(
                package: package,
              ),
              ProductRowItem(
                package: package,
                lastItem: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
