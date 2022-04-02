import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shlink/Processor/PlatformJudge/authenticate_views_change.dart';
import 'package:shlink/Processor/PlatformJudge/registration_views_change.dart';
import 'package:shlink/SystemTest/WebAPI/access_view.dart';

Future <void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBLkZ_PBrhsfWzr5EnXIgzsmQi3mi3QyN0",
        authDomain: "shlink-psychic.firebaseapp.com",
        projectId: "shlink-psychic",
        storageBucket: "shlink-psychic.appspot.com",
        messagingSenderId: "479197348377",
        appId: "1:479197348377:web:9de2d2a66b1e0a9c35a088",
        measurementId: "G-ZKMJZ24TKD"
    ),
  );
  runApp(ScreenUtilInit(
    designSize: Size(360, 690),
    builder: () => PsyChic()
    )
  );
}

class PsyChic extends StatelessWidget
{
  const PsyChic({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'PsyChic',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        // ログイン状態をFirebaseへ問い合わせ・ホームへ遷移かログイン画面へ遷移かを選択します。
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const SizedBox();
          }

          if(snapshot.hasData){
            return AuthenticatePlatform();
          }

          return AuthenticatePlatform();
        },
      ),
    );
  }
}