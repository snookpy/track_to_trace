import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:track_to_trace/models/package_model.dart';
import 'package:track_to_trace/widgets/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final packageState = Provider.of<PackageModel>(context);

    return packageState.isFetching
        ? Container(
            child: CupertinoActivityIndicator(),
          )
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: const Text('Shipped Pack'),
            ),
            child: SafeArea(
              child: CupertinoScrollbar(
                child: ListView(
                  children: <Widget>[
                    ...packageState.packages
                        .map(
                          (pa) => ProductRowItem(
                            package: pa,
                            lastItem: false,
                          ),
                        )
                        .toList()
                  ],
                ),
              ),
            ),
          );
  }
}
