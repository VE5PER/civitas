import 'package:civitas/profile/profilecontent.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';

class ChangePasswordScreen extends StatefulWidget {
  userinfo currentUser;
  ChangePasswordScreen(this.currentUser);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldPw = TextEditingController();
  TextEditingController newPw = TextEditingController();
  TextEditingController confirmNewPw = TextEditingController();

  bool _oldPwVis = false;
  bool _newPwVis = false;
  bool _confirmNewPwVis = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        child: Card(
          elevation: 5,
          shadowColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: oldPw,
                    keyboardType: TextInputType.text,
                    obscureText: _oldPwVis,
                    onChanged: (str) {},
                    decoration: InputDecoration(
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      labelText: "Old Password",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_oldPwVis
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _oldPwVis = !_oldPwVis;
                          });
                        },
                      ),
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: newPw,
                    keyboardType: TextInputType.text,
                    obscureText: _newPwVis,
                    onChanged: (str) {},
                    decoration: InputDecoration(
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      labelText: "New Password",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_newPwVis
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _newPwVis = !_newPwVis;
                          });
                        },
                      ),
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: confirmNewPw,
                    keyboardType: TextInputType.text,
                    obscureText: _confirmNewPwVis,
                    onChanged: (str) {},
                    decoration: InputDecoration(
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      labelText: "Old Password",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_confirmNewPwVis
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _confirmNewPwVis = !_confirmNewPwVis;
                          });
                        },
                      ),
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    elevation: 5.0,
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () {
                        if (newPw.text.length < 6 ||
                            confirmNewPw.text.length < 6) {
                          showSnackbar(context,
                              'Length of Passwords should be greater than 6!!');
                        } else {
                          String message = widget.currentUser.setPassword(
                              currentPassword: oldPw.text,
                              newPassword: newPw.text,
                              confirmNewPassword: confirmNewPw.text);
                          showSnackbar(context, message);
                        }
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showSnackbar(BuildContext context, String msg) {
  var snackBar = SnackBar(
    content: Text('$msg'),
    action: SnackBarAction(
      label: 'ok',
      onPressed: () {
        print('undo pressed');
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
