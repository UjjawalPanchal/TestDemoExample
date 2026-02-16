/*
* Created by ujjawal on 13/02/26.
*/
import 'package:get/get.dart';

class CountController extends GetxController {
  int count = 0;
  var name = "0".obs;

  void onButtonPress() {
    count++;
    name.value = "test chack";
    // update(['name', 'count']);
  }
}
