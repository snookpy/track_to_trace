import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:track_to_trace/models/package_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final packageState = Provider.of<PackageModel>(context);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Login to T T T'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 12.0,
              ),
              Text('Your phone number'),
              SizedBox(
                height: 12.0,
              ),
              CupertinoTextField(
                controller: userPhoneNumber,
                keyboardType: TextInputType.numberWithOptions(),
                // autofocus: true
              ),
              SizedBox(
                height: 18.0,
              ),
              CupertinoButton(
                child: Text("Next"),
                onPressed: () {
                  // packageState.cleanPackage();
                  packageState.getPackages();

                  Navigator.pushNamed(context, '/main');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
