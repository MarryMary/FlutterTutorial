
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shlink/Processor/PlatformJudge/authenticate_views_change.dart';
import 'package:shlink/Processor/Authenticate/registration_authenticate_processor.dart';
import 'package:shlink/Processor/Tools/validation.dart';
import 'package:shlink/UserInterface/ChatMain/chat_page.dart';

/*
* Webまたはデスクトップアプリに最適化されたUIを提供します。
*/

class WebRegistrationPage extends StatefulWidget
{
  @override
  _RegistPage createState() => _RegistPage();
}

class _RegistPage extends State<WebRegistrationPage>
{
  String message = '会員登録をして会話を開始しましょう！';

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
                        "はじめまして！",
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
                            hintText: "foo.bar.thisisexample@gmail.com",
                            labelText: "メールアドレス"
                        ),
                          onChanged: (String value) {
                            setState(() {
                              email = value;
                            });
                          }
                      ),

                      TextFormField(
                          decoration: InputDecoration(
                            labelText: "パスワード",
                          ),
                          obscureText: true,
                          onChanged: (String value) {
                            setState(() {
                              password = value;
                            });
                          }
                      ),

                      Container(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "パスワードは8文字以上16文字以下で大文字・小文字・数字・記号(! @ # \$ & * ~)がそれぞれ1つ以上入っている必要があります"
                        ),
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "ユーザー名",
                            hintText: "相葉夕美"
                        ),
                        onChanged: (String value){
                          setState(() {
                            username = value;
                          });
                        },
                      ),

                      SizedBox(
                        width: 100.w,
                        child: Container(
                          padding: EdgeInsets.only(top: 10.sp),
                          child: ElevatedButton(
                            child: Container(
                              padding: EdgeInsets.all(2.sp),
                              child: Text(
                                "登録",
                                style: TextStyle(
                                  fontSize: 5.sp,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              String varidated = passwordvaridation(password);
                              if(varidated == "ALLOK") {
                                bool result = await RegistrationToFirebase(
                                    email, password, username);
                                if (result) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => AuthenticatePlatform(),
                                      )
                                  );
                                } else if (!result) {
                                  this.message = "登録失敗（DEBUG MESSAGE）";
                                }
                              }else{
                                this.message = varidated;
                              }
                            },
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(top: 10.sp),
                        child: Row(
                            children: <Widget>[
                              Text("アカウントをお持ちですか？："),
                              TextButton(
                                child: Text("ログイン"),
                                onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => AuthenticatePlatform(),
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