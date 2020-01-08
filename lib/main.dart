import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:track_to_trace/models/package_model.dart';
import 'package:track_to_trace/models/tracking_model.dart';
import 'package:track_to_trace/pages/create_package.dart';
import 'package:track_to_trace/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  return runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PackageModel>(create: (_) => PackageModel()),
        ChangeNotifierProvider<TrackingModel>(create: (_) => TrackingModel()),
      ],
      child: CupertinoApp(
        home: CupertinoStoreHomePage(),
      ),
    );
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CupertinoTabController tabController = CupertinoTabController();

    void goHomeTab() {
      tabController.index = 0;
    }

    return CupertinoTabScaffold(
      controller: tabController,
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.collections),
            title: Text('Packages'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add_circled),
            title: Text('Create'),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return HomePage();
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: CreatePackage(goHomeTab: goHomeTab),
              );
            });
          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Container(),
              );
            });
        }
      },
    );
  }
}
