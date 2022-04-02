
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shlink/SystemTest/WebAPI/access_test.dart';

import '../../Processor/PlatformJudge/authenticate_views_change.dart';

/*
* Webまたはデスクトップアプリに最適化されたUIを提供します。
*/

class WebRegistrationTestPage extends StatefulWidget
{
  @override
  _RegistTestPage createState() => _RegistTestPage();
}

class _RegistTestPage extends State<WebRegistrationTestPage>
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

                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "メールアドレス"
                        ),
                      ),

                      TextField(
                          decoration: InputDecoration(
                              hintText: "foo.bar.thisisexample@gmail.com"
                          ),
                          onChanged: (String value) {
                            setState(() {
                              email = value;
                            });
                          }
                      ),

                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "パスワード"
                        ),
                      ),

                      TextField(
                          obscureText: true,
                          onChanged: (String value) {
                            setState(() {
                              password = value;
                            });
                          }
                      ),

                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "ユーザー名"
                        ),
                      ),

                      TextField(
                        decoration: InputDecoration(
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
                              bool result = await RegistrationToTest();
                              if(result){
                                //TODO 画面推移
                                //仮置き
                                message = "登録成功（DEBUG MESSAGE）";
                              }else if(!result){
                                message = "登録に失敗しました：必須項目が入力されていません。全ての項目を入力して下さい。";
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