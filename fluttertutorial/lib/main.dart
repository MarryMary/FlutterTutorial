import 'package:flutter/material.dart';

//別ファイルからクラスのインポート
import 'package:fluttertutorial/RandomWordsModule.dart';


//C言語よろしくmain関数が初めに呼び出される
void main(){
  runApp(const MyApp());
}

// final -> 後から代入できない。コンパイル時に評価されないため変数に変数を代入可
// const -> 後から代入できない。コンパイル時に評価されるため変数に変数を代入不可

// 変化がない静的widget
class MyApp extends StatelessWidget{
  // コンストラクタ
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}