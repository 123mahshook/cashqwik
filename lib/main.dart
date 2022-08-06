import 'package:cashqwik/app/config/app_module_container.dart';
import 'package:cashqwik/core/config/module_container.dart';
import 'package:cashqwik/screens/splash_screen/splash_screen.dart';
import 'package:cashqwik/utility/providers/cart_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:provider/provider.dart';

//recive message in app in background solution
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));

  await ModuleContainer.initialise(Injector());
  await AppModuleContainer.initialise(Injector());
  /*await Firebase.initializeApp();
  DeepLinkService.instance?.handleDynamicLinks();*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 760),
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: CartProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'cash Qwick',
          //  navigatorKey: FcmNavigationService.navigatorKey,
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
