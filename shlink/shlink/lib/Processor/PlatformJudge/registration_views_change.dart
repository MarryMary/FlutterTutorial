import 'package:universal_platform/universal_platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shlink/UserInterface/Authenticate/registration_page.dart';

/*
* 認証ページ表示分岐
* ログインの際、プラットフォームによって最適化されたUIを振り分けて表示する役割を担います。
*/
class RegistrationPlatform extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    // AndroidまたはFuchsiaの場合に提供するUI
    // FuchsiaはもしかするとGalaxyに乗ったりする可能性があるので一応判定。現状ほぼAndroid用
    if(UniversalPlatform.isAndroid || UniversalPlatform.isFuchsia){
      // TODO AndroidまたはFuchsia用UI
      return MaterialApp(
        title: 'PsyChic(PROTO 1)',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: WebRegistrationPage(),
      );
    }

    // IOSの場合に提供するUI
    else if(UniversalPlatform.isIOS){
      //TODO iOS用UI
      return MaterialApp(
        title: 'PsyChic(PROTO 1)',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: WebRegistrationPage(),
      );
    }

    // デスクトップまたはWebであった場合に提供するUI
    else if(UniversalPlatform.isDesktopOrWeb){

      // デスクトップの場合に提供するUI
      if(UniversalPlatform.isDesktop){
        return MaterialApp(
          title: 'PsyChic(PROTO 1)',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.system,
          home: WebRegistrationPage(),
        );
      }

      // Webブラウザからのアクセスの場合に提供するUI
      else if(UniversalPlatform.isWeb){
        return MaterialApp(
          title: 'PsyChic(PROTO 1)',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.system,
          home: WebRegistrationPage(),
        );
      }

      // 補足できないプラットフォームへの対応
      else{
        return MaterialApp(
          title: 'PsyChic(PROTO 1)',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.system,
          home: WebRegistrationPage(),
        );
      }
    }

    // 補足できないプラットフォームへの対応
    else{
      return MaterialApp(
        title: 'PsyChic(PROTO 1)',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: WebRegistrationPage(),
      );
    }
  }
}