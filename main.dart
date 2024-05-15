import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mpesa_flutter_plugin/initializer.dart';
import 'package:hostel_one/presentation/home/splashscreen.dart';

//import 'package:http/http.dart' as http;

import 'firebase_options.dart';
//import 'presentation/auth_screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final isUserLoggedIn = await checkUserLoginStatus();
  // Load environment variables from the .env file
  await dotenv.load(fileName: ".env");

  // Set the consumer key and consumer secret from the loaded environment variables
  MpesaFlutterPlugin.setConsumerKey(dotenv.env['consumer_key']!);
  MpesaFlutterPlugin.setConsumerSecret(dotenv.env['consumer_secret']!);

  runApp(
    const MyApp(
        // isUserLoggedIn: isUserLoggedIn,
        ),
  );
}

class MyApp extends StatelessWidget {
  final bool isUserLoggedIn;
  const MyApp({super.key, this.isUserLoggedIn = false});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Screen Responsiveness
      useInheritedMediaQuery: true,
      designSize: const Size(375, 825),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        final ThemeData theme = ThemeData();

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hostel Booking App',
          home: SplashScreen(),
          //LoginScreen(),
        );
      },
    );
  }
}
