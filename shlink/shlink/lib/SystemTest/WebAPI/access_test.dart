import 'package:shlink/Processor/LinkAPI/connection_to_gerato.dart';

/*
* ここではFirebaseへの登録・ログインを担当します。
*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shlink/Processor/LinkAPI/connection_to_gerato.dart';

Future<bool> RegistrationToTest() async
{
    var result, AccessJson;

    // Gelatoへ送信するための内容をMAPで定義
    AccessJson = [
      {
      }
    ];

    // 返却されたuidと紐付けるユーザー名をGelatoへ登録
    result = await GelatoConnection(AccessJson, "joke/teapot");

    // Gelatoから成功ステータスが返却された場合はtrue、違う場合はfalseを返却
    if(result){
      return true;
    }else{
      return false;
    }
}