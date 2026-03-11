/*
* Created by ujjawal on 11/03/26.
*/
import 'package:test_project/model_class/login_pojo.dart';

abstract class AuthRepository {
  Future<LoginMainResponse> login(String email, String password);
}
