import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import './home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final _auth = FirebaseAuth.instance;
  var _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final textstyle = TextStyle(fontSize: 30, color: Colors.white);
  String _email;
  String _password;
  // UserCredential authResult;

  void showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occured'),
        content: Text(errorMessage),
        actions: <Widget>[
          FlatButton(
            child: Text('OKAY'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    // try {
    //   setState(() {
    //     _isLoading = true;
    //   });
    //   authResult = await _auth.signInWithEmailAndPassword(
    //     email: _email,
    //     password: _password,
    //   );
    // } on PlatformException catch (err) {
    //   var message = 'An error occurred, pelase check your credentials!';

    //   if (err.message != null) {
    //     message = err.message;
    //   }
    //   showErrorDialog(message);
    // } catch (error) {
    //   var errorMessage = 'Could not authenticate you. Please try again later.';
    //   showErrorDialog(errorMessage);
    //   setState(() {
    //     _isLoading = false;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              color: Color(0xFFF99797),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Emoty",
                    style: textstyle,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: h * 0.03),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: h * 0.05,
                      ),
                      SizedBox(
                        width: w * 0.8,
                        child: TextFormField(
                          cursorColor: Colors.grey,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (!value.contains('@')) {
                              return 'Email is Invalid';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: h * 0.025,
                            ),
                            // isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            border: OutlineInputBorder(
                              gapPadding: 15,
                              borderSide:
                                  BorderSide(color: Colors.black, width: 15.0),
                              borderRadius: BorderRadius.circular(h * 0.035),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      SizedBox(
                        width: w * 0.8,
                        child: TextFormField(
                          cursorColor: Colors.grey,
                          obscureText: true,
                          validator: (value) {
                            if (value.length < 6) {
                              return 'Password is too short';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: h * 0.025,
                            ),
                            // isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            border: OutlineInputBorder(
                              gapPadding: 15,
                              borderSide:
                                  BorderSide(color: Colors.black, width: 15.0),
                              borderRadius: BorderRadius.circular(h * 0.035),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.04,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: w * 0.3),
                          padding: EdgeInsets.symmetric(
                              vertical: h * 0.02, horizontal: w * 0.08),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color(0xFF63DCC7),
                          ),
                          child: Text(
                            'Log in',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
