import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:get/get.dart';

validate(String val, int min, int max, String type, controller) {
  if (type == "confirmPassword") {
    if (controller.passwordCtrl.text != controller.confirmPasswordCtrl.text) {
      return "password doesn't match";
    }
  }
  if (val.isEmpty) {
    return LangKeys.emptyFieldError.tr;
  }
  if (type == "userName" && !GetUtils.isUsername(val)) {
    return "this username not valid";
  }

  if (type == "email" && !GetUtils.isEmail(val)) {
    return "this email not valid";
  }

  if (type == "phone" && !GetUtils.isPhoneNumber(val)) {
    return "this phone not valid";
  }

  if (val.length < min) {
    return "${LangKeys.minLengthError.tr}$min";
  }
  if (val.length > max) {
    return "${LangKeys.maxLengthError.tr}$max";
  }
}
