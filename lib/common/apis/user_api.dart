import 'package:ulearning_app/common/entities/user.dart';

import '../utils/http_utils.dart';

class UserApi {
  static login({LoginRequestEntity? param}) async {
    var response = await HttpUtil().post(
      'api/login',
      queryParameters: param?.toJson(),
    );
    // print(response.toString());
    return UserLoginResponseEntity.fromJson(response);
  }
}
