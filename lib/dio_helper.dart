import 'package:dio/dio.dart';

class DioHelper{
  static Dio? dio;
  static init(){
    dio = Dio(
        BaseOptions(
            baseUrl: 'https://fcm.googleapis.com/fcm/',
            receiveDataWhenStatusError:true,
            headers: {
              'Content-Type' : 'application/json',
              'Authorization' : 'key=AAAACgZMku8:APA91bGcUBV1AFIZm7cLP6ILmf1vkwqUPHepMhBdTFEauWgMixZPG452ugyVNCfL7twBxeMq5c1SNb52rL4hM3UYVSMqjb1zI8Gcstljyq0wWNmvoMoV8EiOxE4rPZk6HjuV_NtuOMCp'
            }
        )
    );
  }
  static Future<Response> sendNotification({
    required String? token,
    String? title,
    String? body,
    String? image,
  })
  async{

    return await dio!.post(
      'send',
      data: {
        "to":token,
        "notification" : {
          "title" : title,
          "body" : body,
          "image": image,
          "sound" : "default"
        },
        "android":{
          "priority":"HIGH",
          "notification":{
            "notification_priority":"PRIORITY_MAX",
            "sound":"default",
            "default_sound":true,
            "default_vibrate_timings":true,
            "default_light_settings":true
          }
        },
        // "data":{
        //   "type":"order",
        //   "id":"87",
        //   "click_action":"FLUTTER_NOTIFICATION_CLICK"
        // }
      },
    );
  }
}