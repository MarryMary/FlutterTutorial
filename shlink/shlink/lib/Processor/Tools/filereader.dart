import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> JsonReturn(String file, String key) async
{
  String returnData = await rootBundle.loadString('SystemResource/'+file);
  final jsonGet = json.decode(returnData);
  debugPrint(jsonGet[key]);
  return jsonGet[key];
}