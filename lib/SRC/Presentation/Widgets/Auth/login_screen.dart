import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Application/Services/NavigatorService/navigator_service.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/AppData/app_preferences.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/AppData/data.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/Extensions/responsive_extention.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/colors_pallete.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/strings.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/text_styles.dart';
import 'dart:convert';
import 'package:todoappcleanarchitecturedemo/SRC/Presentation/Common/app_text.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Presentation/Widgets/Dashboard/TodoHome/todo_home.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  @override
  void initState() {
    log("App User >> ${Data.app.user?.name}");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("Here23: ${2.sh}");
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          AppStrings.userForm,
          style: TextStyle(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomTextFieldWithOnTap(
              controller: _nameController,
              hintText: 'Add Name',
              textInputType: TextInputType.text,
            ),
            CustomTextFieldWithOnTap(
              controller: _emailController,
              hintText: 'Add  Email',
              textInputType: TextInputType.text,
            ),
            Center(
              child: ElevatedButton(
                onPressed: _submit,
                child: AppText(
                  'Submit',
                  style: Styles.circularStdRegular(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim();

    if (name.isNotEmpty && email.isNotEmpty) {
      // Create a UserModel object and do something with it
      UserModel userModel = UserModel(name: name, email: email);
      await SharedPrefs.setUserLoginData(userRawData: userModel)
          .whenComplete(() {
        SharedPrefs.getUserLoginData();

        Data.app
            .serviceNavigatorLocator<Navigate>()
            .to(context, const TodoHome());
      });

      print(userModel
          .toJson()); // For demonstration, print the JSON representation
    } else {
      /// Show an error message if any field is empty
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     return AlertDialog(
      //       title: Text('Error'),
      //       content: Text('Please fill in all fields.'),
      //       actions: <Widget>[
      //         TextButton(
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //           child: Text('OK'),
      //         ),
      //       ],
      //     );
      //   },
      // );
    }
  }
}

class UserModel {
  final String? id;
  final String? name;
  final String? email;

  UserModel({
    this.id,
    this.name,
    this.email,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
      };
}
