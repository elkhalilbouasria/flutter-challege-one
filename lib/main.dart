import 'package:flutter/material.dart';
import 'package:flutter_challenge_1/providers/ThemeChangerProvider.dart';
import 'package:flutter_challenge_1/screens/CommunityPage.dart';
import 'package:flutter_challenge_1/screens/DiscoverPage.dart';
import 'package:flutter_challenge_1/screens/WalletPage.dart';
import 'package:flutter_challenge_1/themes/ThemesData.dart';
import 'package:flutter_challenge_1/widgets/BottomNavigationWidget.dart';
import 'providers/NavigationProvider.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';
import 'screens/AccountPage.dart';
void main() => runApp(MultiProvider(
   providers: [
     ChangeNotifierProvider<NavigationProvider>(
       create: (context) => NavigationProvider(),
       child: BottomNavigationWidget(),
     ),
     ChangeNotifierProvider<ThemeChangerProvider>(
       create: (context) => ThemeChangerProvider(darkTheme()),
       child: MyApp(),
     )
   ],
   child:  MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChangerProvider>(context);
    return MaterialApp(
      title: 'Flutter Challenge',
      theme: theme.getTheme(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return PageTransition(child: AccountPage(), type: PageTransitionType.fade);
            break;
          case '/Account':
            return PageTransition(child: AccountPage(), type: PageTransitionType.fade);
            break;
          case '/Wallet':
            return PageTransition(child: WalletPage(), type: PageTransitionType.fade);
            break;
          case '/Discover':
            return PageTransition(child: DiscoverPage(), type: PageTransitionType.fade);
            break;
          case '/Community':
            return PageTransition(child: CommunityPage(), type: PageTransitionType.fade);
            break;
          default:
            return null;
        }
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
