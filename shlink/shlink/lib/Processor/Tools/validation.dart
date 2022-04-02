
/*
*　パスワード最低要件
* 8文字以上16文字以下
* 記号(! @ # $ & * ~)
* 大文字・小文字・数字が入っている
 */
String passwordvaridation(String password)
{
  if(password.isEmpty){
    return "パスワードを入力してください";
  }else{
    var count = password.length;
    if(count >= 8 && count <= 16){
      String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
      RegExp regExp = new RegExp(pattern);
      if(regExp.hasMatch(password)){
        return "ALLOK";
      }else{
        return 'パスワードには大文字・小文字・数字・記号(! @ # \$ & * ~)がそれぞれ1つ以上入っている必要があります。';
      }
    }else{
      return "パスワードは8文字以上16文字以下である必要があります。";
    }
  }
}