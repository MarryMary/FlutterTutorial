
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shlink/Processor/PlatformJudge/registration_views_change.dart';
import 'package:shlink/Processor/Authenticate/login_processor.dart';
import 'package:shlink/UserInterface/ChatMain/chat_page.dart';

/*
* Webまたはデスクトップアプリに最適化されたログインUIを提供します。
*/

class WebAuthenticatePage extends StatefulWidget
{
  @override
  _AuthPage createState() => _AuthPage();
}

class _AuthPage extends State<WebAuthenticatePage>
{
  String message = 'ログインして会話に参加しましょう！';

  String email = '';
  String password = '';


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
                          "ようこそ！",
                          style: GoogleFonts.mPlusRounded1c(
                            fontSize: 8.sp
                          ),
                      ),

                      Container(
                        padding: EdgeInsets.only(bottom: 10.sp),
                        child: Text(
                          message,
                          style: GoogleFonts.mPlusRounded1c(
                              fontSize: 4.sp
                          ),
                        ),
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "メールアドレス"
                        ),
                        onChanged: (String value){
                          setState((){
                            email = value;
                          });
                        },
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "パスワード"
                        ),
                        obscureText: true,
                        onChanged: (String value){
                          setState((){
                            password = value;
                          });
                        }
                      ),

                      Container(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                            child: Text("パスワードを忘れた"),
                            onPressed: (){},
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
                                  "ログイン",
                                  style: TextStyle(
                                    fontSize: 5.sp,
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                bool result = await AuthorizeRequestToFireBase(email, password);
                                if(result){
                                  message = "ログイン成功(DEBUG MESSAGE)";
                                }else if(!result){
                                  message = "ログイン失敗(DEBUG MESSAGE)";
                                }
                              },
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(top: 10.sp),
                        child: Row(
                          children: <Widget>[
                            Text("アカウントをお持ちではありませんか？："),
                            TextButton(
                              child: Text("新規会員登録"),
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => RegistrationPlatform(),
                                  )
                                );
                              },
                            ),
                          ]
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