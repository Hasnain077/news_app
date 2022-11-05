import 'package:shared_preferences/shared_preferences.dart';

class CommonController{

  Future<void> setIntroductionPref() async{
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    await prefs.setBool('isOld', true);
  }
  Future<bool> getInstroductionPref() async{

  final SharedPreferences prefs =  await SharedPreferences.getInstance();
  return prefs.getBool("isOld") ?? false;
  }
}