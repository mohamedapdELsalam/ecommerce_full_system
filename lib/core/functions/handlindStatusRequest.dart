import 'package:ecommerceapp/core/class/status_request.dart';

handlindStatusRequest(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
