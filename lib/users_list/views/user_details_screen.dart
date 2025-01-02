import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/app_title.dart';
import '../view_models/user_view_model.dart';

class UserDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(usersViewModel.selectedUser.name),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(text: usersViewModel.selectedUser.name),
            SizedBox(height: 5.0),
            Text(
              usersViewModel.selectedUser.email,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5.0),
            Text(
              usersViewModel.selectedUser.phone,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5.0),
            Text(
              usersViewModel.selectedUser.website,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5.0),
            Text(
              usersViewModel.selectedUser.address!.street,
              style: TextStyle(color: Colors.black),
            ),
            Text(
              usersViewModel.selectedUser.address!.city,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
