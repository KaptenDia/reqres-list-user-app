import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list_users_app/domain/user/user_resp.dart';

class UserService extends ChangeNotifier {
  UserResp responseData = UserResp();

  /// Retrieves user data from the API endpoint.
  ///
  /// This function sends a GET request to the API endpoint
  /// "https://reqres.in/api/users?page=2" and parses the response
  /// into a [UserResp] object. If the response status code is 200,
  /// the parsed data is stored in [responseData] and the listeners
  /// are notified. The parsed data is also logged using the [log]
  /// function. If the response status code is not 200, an error message
  /// is logged. If an exception occurs during the request, the exception
  /// is logged.
  ///
  /// Returns a [Future] that completes with the parsed [UserResp] object.
  Future<UserResp> getData() async {
    try {
      final response =
          await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        responseData = UserResp.fromJson(item);
        notifyListeners();
        log('Response List User : ${item.toString()}');
      } else {
        log('Ada Kesalahan');
      }
    } catch (e) {
      log(e.toString());
    }

    return responseData;
  }
}
