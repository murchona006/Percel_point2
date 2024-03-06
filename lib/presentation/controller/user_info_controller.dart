import 'dart:convert';

import 'package:get/get.dart';
import 'package:percel_point/data/local/storage_healper.dart';
import 'package:percel_point/data/model/user_info.dart';
import 'package:percel_point/data/remote/user_info_api.dart';

class UserInfoController extends GetxController {
  UserInfoResponse? userInfoResponse;
  @override
  void onInit() {
    if (StorageHelper.getString(key: 'token') != null) {
      getUserInfo();
    }

    super.onInit();
  }

  getUserInfo() {
    try {
      UserInfoApi.getUserInfo(token: StorageHelper.getString(key: 'token'))
          .then((value) {
        final body = json.decode(value);
        userInfoResponse = UserInfoResponse.fromJson(body);
      }).onError((error, stackTrace) {
        userInfoResponse = null;
        print('eee');
        print(error);
      });
    } catch (error) {
      userInfoResponse = null;
      print('rooo');
      print(error);
    }
  }
}
