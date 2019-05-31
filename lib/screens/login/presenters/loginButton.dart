import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth0/flutter_auth0.dart';

final clientId = 'qjj6tlSJFwm7R5Ap7aUJMIx8DwjMj5dO';
final domain = 'dev-0-i4imh7.auth0.com';
final Auth0 auth = new Auth0(clientId: clientId, domain: domain);
final WebAuth web = new WebAuth(clientId: clientId, domain: domain);

class LoginButton extends StatelessWidget {
  final Color primaryColor;
  final dynamic loginCallback;
  LoginButton({Key key, this.primaryColor, this.loginCallback});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  splashColor: this.primaryColor,
                  color: this.primaryColor,
                  child: new Row(
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      new Expanded(
                        child: Container(),
                      ),
                      new Transform.translate(
                        offset: Offset(15.0, 0.0),
                        child: new Container(
                          padding: const EdgeInsets.all(5.0),
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(28.0)),
                            splashColor: Colors.white,
                            color: Colors.white,
                            child: Icon(
                              Icons.arrow_forward,
                              color: this.primaryColor,
                            ),
                            onPressed: () => {},
                          ),
                        ),
                      )
                    ],
                  ),
                  onPressed: loginCallback,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  splashColor: Color(0xFF3B5998),
                  color: Color(0xff3B5998),
                  child: new Row(
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "LOGIN WITH FACEBOOK",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      new Expanded(
                        child: Container(),
                      ),
                      new Transform.translate(
                        offset: Offset(15.0, 0.0),
                        child: new Container(
                          padding: const EdgeInsets.all(5.0),
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(28.0)),
                            splashColor: Colors.white,
                            color: Colors.white,
                            child: Icon(
                              const IconData(0xea90, fontFamily: 'icomoon'),
                              color: Color(0xff3b5998),
                            ),
                            onPressed: () => {},
                          ),
                        ),
                      )
                    ],
                  ),
                  onPressed: loginCallback,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
