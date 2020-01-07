import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:track_to_trace/models/package_model.dart';
import 'package:track_to_trace/pages/home_page.dart';
import 'package:track_to_trace/pages/login_page.dart';

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
    return ChangeNotifierProvider<PackageModel>(
      create: (_) => PackageModel(),
      child: CupertinoApp(onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/main':
            return CupertinoPageRoute(
                builder: (_) => CupertinoStoreHomePage(), settings: settings);
          default:
            return CupertinoPageRoute(
                builder: (_) => LoginPage(), settings: settings);
        }
      }),
    );
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final packageState = Provider.of<PackageModel>(context);
    packageState.getPackages();

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
            title: Text('Main'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.collections),
            title: Text('History'),
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
                child: HomePage(),
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
