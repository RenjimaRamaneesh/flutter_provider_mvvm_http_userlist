
import 'package:flutter/cupertino.dart';

import '../models/user_error.dart';
import '../models/user_list_model.dart';
import '../repo/api_status.dart';
import '../repo/user_services.dart';


class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError? _userError; // Make nullable
  late UserModel _selectedUser;
  UserModel _addingUser = UserModel();

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError? get userError => _userError;
  UserModel get selectedUser => _selectedUser;
  UserModel get addingUser => _addingUser;

  UsersViewModel({UserModel? selectedUser}) {
    _selectedUser = selectedUser ?? UserModel(); // Default value if null
    getUsers();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
    _userError = null; // Clear any previous errors when data is successfully fetched
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
    notifyListeners();
  }

  setSelectedUser(UserModel userModel) {
    _selectedUser = userModel;
  }

  addUser() async {
    if (!isValid()) {
      return;
    }
    _userListModel.add(addingUser);
    _addingUser = UserModel();
    notifyListeners();
    return true;
  }

  isValid() {
    if (addingUser.name.isEmpty) {
      return false;
    }
    if (addingUser.email.isEmpty) {
      return false;
    }
    return true;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    } else if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse?.toString(),
      );
      setUserError(userError);
    }
    setLoading(false);
  }
}

/*class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  late UserError _userError; // Use 'late' but initialize in constructor
  late UserModel _selectedUser; // Use 'late' but initialize in constructor
  UserModel _addingUser = UserModel();

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError get userError => _userError;
  UserModel get selectedUser => _selectedUser;
  UserModel get addingUser => _addingUser;

  // Constructor with initial values for _userError and _selectedUser
  UsersViewModel({UserError? userError, UserModel? selectedUser}) {
    _userError = userError ?? UserError(code: 0, message: ''); // Default value if null
    _selectedUser = selectedUser ?? UserModel(); // Default value if null
    getUsers();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  setSelectedUser(UserModel userModel) {
    _selectedUser = userModel;
  }

  addUser() async {
    if (!isValid()) {
      return;
    }
    _userListModel.add(addingUser);
    _addingUser = UserModel();
    notifyListeners();
    return true;
  }

  isValid() {
    if (addingUser.name.isEmpty) {
      return false;
    }
    if (addingUser.email.isEmpty) {
      return false;
    }
    return true;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse?.toString(),
      );
      setUserError(userError);
    }
    setLoading(false);
  }
}*/

