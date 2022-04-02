import 'package:intl/intl.dart';
import 'package:shlink/Processor/LinkAPI/connection_to_gerato.dart';

Future<bool> ApplicationLogSenderToGelato(String logmessage) async{
  try{
    var logtime, AccessJson, result;

    logtime = DateFormat('yyyy-MM-dd\nHH:mm').format(DateTime.now());

    AccessJson = {
      "log_time": logtime,
      "log_message": logmessage
    };

    result = await GelatoConnection(AccessJson, "Develop/LogTracking");
    return result;
  }catch(e){
    return false;
  }
}