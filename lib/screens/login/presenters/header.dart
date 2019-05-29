import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  final AssetImage backgroundImage;
  final Color primaryColor;
  LoginHeader({Key key, this.backgroundImage, this.primaryColor});
  @override
  Widget build(BuildContext context) {
    return new ClipPath(
      clipper: MyClipper(),
      child: Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: this.backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 150.0),
        child: Column(
          children: <Widget>[
            lanaLogo()
          ],
        ),
      ),
    );
  }

  Container lanaLogo() {
    AssetImage assetImage =
        AssetImage('assets/images/android-chrome-192x192.png');
    Image logo = Image(
      image: assetImage,
      fit: BoxFit.cover,
      alignment: new Alignment(-1.0, -10.0),
    );
    return Container(
      child: logo,
      margin: EdgeInsets.only(top: 100),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height * 0.85);
    p.arcToPoint(
      Offset(0.0, size.height * 0.85),
      radius: const Radius.elliptical(50.0, 10.0),
      rotation: 0.0,
    );
    p.lineTo(0.0, 0.0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
