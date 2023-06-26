import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'backend/firebase/firebase_config.dart';
import 'custom_code/actions/SendNotification.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scaffale_admin/custom_code/widgets/GradientIcon.dart';
import 'flutter_flow/nav/nav.dart';
import 'package:flutter/foundation.dart';

import 'index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();

  await FlutterFlowTheme.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  await Firebase.initializeApp(
  );

  getToken();
  listenFCM();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<BaseAuthUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier();
    _router = createRouter(_appStateNotifier);
    userStream = scaffaleAdminFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(seconds: 1),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ScaffaleAdmin',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'HomePage_Admin';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {

    final tabs = {
      'HomePage_Admin': HomePageAdminWidget(),
      'Search': SearchWidget(),
      'profile': ProfileWidget(),
      'Scaffale': ScaffaleWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar:
      Container(
        clipBehavior: Clip.hardEdge, //or better look(and cost) using Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child:BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (i) => setState(() {
            _currentPage = null;
            _currentPageName = tabs.keys.toList()[i];
          }),
          backgroundColor: Color(0xFF232323),
          selectedItemColor: FlutterFlowTheme.of(context).primaryText,
          unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                FFIcons.khousepath,
                size: 30.0,
              ),
              activeIcon:GradientIcon(
                FFIcons.khousepath,
                25.0,
                LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF00FE0D),Color(0xFF00D1FD)],
                ),
              ),
              label: '',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FFIcons.kmagnifyingGlasspath,
                size: 24.0,
              ),
              activeIcon:GradientIcon(
                FFIcons.kmagnifyingGlasspath,
                25.0,
                LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF00FE0D),Color(0xFF00D1FD)],
                ),
              ),
              label: '',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FFIcons.kuserpath,
                size: 24.0,
              ),
              activeIcon:GradientIcon(
                FFIcons.kuserpath,
                25.0,
                LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF00FE0D),Color(0xFF00D1FD)],
                ),
              ),
              label: FFLocalizations.of(context).getText(
                'k8zwx4j8' /*  */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FFIcons.kbookspath,
                size: 24.0,
              ),
              activeIcon:GradientIcon(
                FFIcons.kbookspath,
                25.0,
                LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF00FE0D),Color(0xFF00D1FD)],
                ),
              ),
              label: FFLocalizations.of(context).getText(
                'lxtuc4in' /* Home */,
              ),
              tooltip: '',
            )
          ],
        ),
      ),
    );
  }
}
void listenFCM() async {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      log('70da: this is NOTIFICATION BITCH.....');
    }
  });
}
String generatedToken = "";

void getToken() async {
  await FirebaseMessaging.instance.getToken().then((token) {
    generatedToken = token!;
  });
}
