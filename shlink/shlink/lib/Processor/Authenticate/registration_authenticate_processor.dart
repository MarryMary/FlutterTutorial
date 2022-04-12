/*
* ここではFirebaseへの登録・ログインを担当します。
*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shlink/Processor/LinkAPI/connection_to_gerato.dart';

Future<bool> RegistrationToFirebase(String email, String password, String username) async
{
  try {
    var uid, result, AccessJson;

    // Firebase Authenticationへ連絡・ユーザー登録を行い、ユーザーのUIDを問い合わせ・返却
    uid = await FireBaseUidReturn(email, password);

    // Gelatoへ送信するための内容をMAPで定義
    AccessJson = {
        "username": username,
        "uid": uid
      };

    // 返却されたuidと紐付けるユーザー名をGelatoへ登録
    result = await GelatoConnection(AccessJson, "Authentication/Register");

    // Gelatoから成功ステータスが返却された場合はtrue、違う場合はfalseを返却
    return result;
  }catch (e){
    // 問題があった場合はFalseを返却
    return false;
  }
}

AuthenticationToGoGerato() async
{
  //TODO 認証
}

Future<String> FireBaseUidReturn(String email, String password) async {
  // Firebase接続用インスタンスを作成
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Firebaseへメールアドレス・パスワードを挿入
  final authResult = await auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  final _isVerified = await auth.currentUser?.emailVerified;

  if(!_isVerified!) {
    // メールアドレスアクティベーションを実施
    await auth.currentUser?.sendEmailVerification();
  }

  final UserId = authResult.user!.uid;

  await auth.signOut();

  // authResult.userがnullになる可能性はないので、!で強制的に返却
  return UserId;
}