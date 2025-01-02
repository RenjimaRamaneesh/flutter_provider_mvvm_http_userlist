import 'package:flutter/material.dart';

import '../users_list/models/user_list_model.dart';
import 'app_title.dart';


class UserListRow extends StatelessWidget {
  final UserModel userModel;
  final GestureTapCallback? onTap;

  const UserListRow({
    Key? key,
    required this.userModel,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(

        padding: const EdgeInsets.all(8.0), // Added padding for better layout
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(text: userModel.name), // Assuming AppTitle is defined elsewhere
            Text(
              userModel.email,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
