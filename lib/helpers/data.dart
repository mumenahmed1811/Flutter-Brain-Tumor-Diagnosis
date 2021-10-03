
import 'package:shared_preferences/shared_preferences.dart';

String apiUrl(){
  return 'http://192.168.1.5:8080/brain_tumor_diagnosis/api/';
}
String imgPreUrl(){
  return 'http://192.168.1.5:8080/brain_tumor_diagnosis/storage/app/';
}
Future<SharedPreferences> getPrefs() async{
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  return await _prefs;
}
