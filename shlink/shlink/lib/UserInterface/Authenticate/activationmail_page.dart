
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shlink/Processor/PlatformJudge/activationpage_views_change.dart';
import 'package:shlink/Processor/PlatformJudge/authenticate_views_change.dart';
import 'package:shlink/Processor/Authenticate/registration_authenticate_processor.dart';
import 'package:shlink/Processor/Tools/validation.dart';
import 'package:shlink/UserInterface/ChatMain/chat_page.dart';

/*
* Webまたはデスクトップアプリに最適化されたUIを提供します。
*/

class WebActivationPage extends StatefulWidget
{
  @override
  _RegistPage createState() => _RegistPage();
}

class _RegistPage extends State<WebActivationPage>
{
  String message = 'ご指定のメールアドレスにアクティベーションコードを送信しました。メール内に記載のURLからアクティベートを行ってください。';

  String email = '';
  String password = '';
  String username = '';


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 90.sp, right: 90.sp),
        child: Center(
          child: Card(
            child: Container(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "登録処理完了",
                        style: GoogleFonts.mPlusRounded1c(
                            fontSize: 8.sp
                        ),
                      ),

                      SizedBox(
                        width: 100.w,
                        child: Container(
                          padding: EdgeInsets.only(top: 10.sp),
                          child: ElevatedButton(
                            child: Container(
                              padding: EdgeInsets.all(2.sp),
                              child: Text(
                                "ログインページへ",
                                style: TextStyle(
                                  fontSize: 5.sp,
                                ),
                              ),
                            ),
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ActivationPlatform(),
                                  )
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}