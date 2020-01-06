import 'package:flutter/cupertino.dart';
import 'package:track_to_trace/widgets/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Shipped Pack'),
      ),
      child: SafeArea(
        child: CupertinoScrollbar(
          child: ListView(
            children: <Widget>[
              ProductRowItem(),
              ProductRowItem(),
              ProductRowItem(),
              ProductRowItem(),
            ],
          ),
        ),
      ),
    );
  }
}
