
import 'package:flutternews/common/entity/entity.dart';
import 'package:flutternews/common/utils/utils.dart';

class UserAPI {
  /// 登录
  static Future<UserResponseEntity> login({UserRequestEntity params}) async {
    var response = await HttpUtil().post('/user/login', params: params);
    return UserResponseEntity.fromJson(response);
  }
}