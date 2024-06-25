import 'package:flutter/material.dart';
import 'package:list_users_app/domain/user/user_resp.dart';
import 'package:list_users_app/services/user_service.dart';

class UserProvider with ChangeNotifier {
  bool isLoading = false;
  bool isAscending = false;
  bool isSelected = false;
  UserService services = UserService();
  UserResp dataUser = UserService().responseData;

  /// Retrieves user data asynchronously.
  ///
  /// This function sets the `isLoading` flag to `true` to indicate that the
  /// data retrieval process has started. It then calls the `getData()` method
  /// of the `services` object to fetch the user data. Once the data is
  /// retrieved, it sets the `dataUser` variable to the retrieved data and
  /// sets the `isLoading` flag to `false` to indicate that the data retrieval
  /// process has completed. Finally, it calls the `notifyListeners()` method
  /// to notify any listeners that the data has been updated.
  void getUserData() async {
    isLoading = true;
    dataUser = await services.getData();
    isLoading = false;
    notifyListeners();
  }

  // Sorts the user data based on the first name in ascending or descending order.
  void sortUserData({required bool ascending}) {
    dataUser.data?.sort((a, b) {
      final firstNameA = a.firstName ?? '';
      final firstNameB = b.firstName ?? '';
      return ascending
          ? firstNameA.compareTo(firstNameB)
          : firstNameB.compareTo(firstNameA);
    });
    notifyListeners();
  }
}
