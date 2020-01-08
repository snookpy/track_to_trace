import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:track_to_trace/models/package_model.dart';
import 'package:track_to_trace/widgets/delete_backdrop.dart';
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
                          (pa) => Dismissible(
                            background: DeleteBackdrop(),
                            child: ProductRowItem(
                              package: pa,
                              lastItem: false,
                            ),
                            key: ObjectKey(pa),
                            confirmDismiss: (DismissDirection direction) async {
                              return await showCupertinoDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CupertinoAlertDialog(
                                    title: const Text("Confirm"),
                                    content: const Text(
                                        "Are you sure you wish to delete this item?"),
                                    actions: <Widget>[
                                      CupertinoButton(
                                          onPressed: () {
                                            packageState.removePackage(pa);
                                            Navigator.of(context).pop(true);
                                            return true;
                                          },
                                          child: const Text("DELETE")),
                                      CupertinoButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                          return false;
                                        },
                                        child: const Text("CANCEL"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
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
