import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper  { // cache data
  static late SharedPreferences sharedPreferences ;
  static init () async{//starting point
    sharedPreferences = await SharedPreferences.getInstance();//create file
  }
  static Future<bool> putData ({ // saving cache data
    required String key ,
    required bool value ,
  })async{
    return await sharedPreferences.setBool(key, value);
  }

  static Future<bool> saveData ({ // saving cache data
    required String key ,
    required String value ,
  })async{
    return await sharedPreferences.setString(key, value);
  }

  static bool getData({ // get cache data
    required String key ,
  }){
    return sharedPreferences.getBool(key)??false;
  }

  static String getData2({ // get cache data
    required String key ,
  }){
    return sharedPreferences.getString(key)?? 'false';
  }
}