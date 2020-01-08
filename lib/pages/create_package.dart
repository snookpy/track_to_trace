import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track_to_trace/models/package.dart';
import 'package:track_to_trace/models/package_model.dart';

class CreatePackage extends StatefulWidget {
  final Function goHomeTab;

  CreatePackage({this.goHomeTab});

  @override
  _CreatePackageState createState() => _CreatePackageState();
}

class _CreatePackageState extends State<CreatePackage> {
  final packageController = TextEditingController();
  final trackingController = TextEditingController();

  CupertinoTabController tabController = CupertinoTabController();
  @override
  Widget build(BuildContext context) {
    final packageState = Provider.of<PackageModel>(context);

    void showDialog(String filed) {
      showCupertinoDialog(
          context: context,
          useRootNavigator: false,
          builder: (_) {
            return CupertinoAlertDialog(
              title: Text('Error'),
              content: Text('$filed Field is Empty'),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('ok'))
              ],
            );
          });
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Create Pack'),
      ),
      child: Form(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: <Widget>[
                Text("Package Name"),
                CupertinoTextField(
                  controller: packageController,
                ),
                SizedBox(
                  height: 18,
                ),
                Text("Tracking Number"),
                CupertinoTextField(
                  controller: trackingController,
                ),
                SizedBox(
                  height: 24,
                ),
                CupertinoButton(
                  borderRadius: BorderRadius.circular(12),
                  child: Text("Add"),
                  onPressed: () {
                    if (packageController.text.isEmpty) {
                      showDialog("Package Name");
                    } else if (trackingController.text.isEmpty) {
                      showDialog("Tracking Number");
                    } else {
                      var newPackage = Package(
                          packageName: packageController.text,
                          snNumber: trackingController.text);
                      packageState.addPackage(newPackage);
                      packageController.clear();
                      trackingController.clear();
                      widget.goHomeTab();
                    }
                  },
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
