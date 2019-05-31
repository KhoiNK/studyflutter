import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardButton extends StatelessWidget {
final Color primaryColor;
  DashboardButton({Key key, this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
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
                        "Go to Dashboard",
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
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
