import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shlink/Processor/Tools/filereader.dart';
/*
* サーバーデータ保存用API GERATOへ接続するための関数です。
*/

Future<bool> GelatoConnection(Map AccessJson, String Param) async
{
  // JSONReturn関数で設定ファイルのJSONからGelatoURLの項目を抽出
  var url = await JsonReturn("config.json", "GelatoURL");

  // 設定ファイルで定義されたURLに引数で渡されたパラメータを追加
  url = url+"/"+Param;

  // 引数で渡されたMAPをJSONへエンコード
  var request = jsonEncode(AccessJson);

  // Gelatoへのアクセスを開始
  final response = await http.post(Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: request,
  );

  // もしステータースコードが200(正しく返ってきた)場合
  if(response.statusCode == 200){

    // 結果として返されたJSONファイルをMAP型へデコードしてresultへ代入
    Map<String, dynamic> result = json.decode(response.body);

    // もしresultがMAP型であり、STATUSというキーが存在し、STATUSがStringであり、さらにSTATUSがSUCCESSであった場合はtrue、そうでない場合はfalseを返却
    if(result is Map && result.containsKey("STATUS") && result["STATUS"] is String && result["STATUS"] == "SUCCESS"){
      return true;
    }else{
      return false;
    }
  }else {
    // もしステータスコードが200番以外であった場合はfalseを返却
    return false;
  }
}