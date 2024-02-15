import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _currentPassword, _newPassword;
  bool _isLoading = false;
  final ButtonStyle style =
  ElevatedButton.styleFrom(padding: EdgeInsets.all(10),textStyle: const TextStyle(fontSize: 20,));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,toolbarHeight: 70,elevation: 0,centerTitle: true,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              iconSize: 20,
              icon: const Icon(Iconsax.arrow_left4,color: Colors.black,)),
        ),
        title: Text("Change Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
      ),

      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Current Password',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your current password';
                  }
                  return null;
                },
                onSaved: (value) => _currentPassword = value!,
              ),
              SizedBox(height: 15,),
              TextFormField(

                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  labelText: 'New Password',
                  prefixIcon: Icon(Icons.lock),

                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your new password';
                  }
                  return null;
                },
                onSaved: (value) => _newPassword = value!,
              ),
              SizedBox(height: 15,),
              TextFormField(

                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  labelText: 'Current New Password',
                  prefixIcon: Icon(Icons.lock),

                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your new password';
                  }
                  return null;
                },
                onSaved: (value) => _newPassword = value!,
              ),
              Spacer(),
              ElevatedButton(
                style: style,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    setState(() => _isLoading = true);
                    try {
                      User? user = FirebaseAuth.instance.currentUser;
                      await user?.updatePassword(_newPassword);
                      Navigator.pop(context);
                    } catch (e) {
                      print(e);
                      // Show error message
                    }
                    setState(() => _isLoading = false);
                  }
                },
                child: Text('Change Password'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}