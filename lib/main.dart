import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:track_to_trace/pages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  return runApp(CupertinoApp(
    routes: {
      '/': (_) => LoginPage(),
      '/main': (_) => CupertinoStoreHomePage(),
    },
  ));
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      // child: CupertinoPageScaffold(
      //   navigationBar: CupertinoNavigationBar(
      //     middle: const Text('Cupertino Store'),
      //   ),
      //   child: const SizedBox(),
      // ),
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Products'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            title: Text('Cart'),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {},
    );
  }
}
