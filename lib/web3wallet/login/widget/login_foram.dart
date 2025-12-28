import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/gen/assets.gen.dart';

class LoginForam extends StatelessWidget {
  const LoginForam({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    return Align(
      alignment: AlignmentGeometry.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.images.web3wallet.walletLoginRobot.path),
          Text(
            "Login In",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Container(
            width: w * 0.8,
            height: h * 0.05,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 10, top: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(80),
            ),
            child: Center(
              child: Row(
                children: [
                  Container(
                    width: w * 0.1,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xffFFEBE4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person_outlined,
                      color: Color(0xfff7931a),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Username",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: w * 0.8,
            height: h * 0.05,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(80),
            ),
            child: Center(
              child: Row(
                children: [
                  Container(
                    width: w * 0.1,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xffDEF5E9),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.email_outlined, color: Color(0xff5FC88F)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: w * 0.8,
            height: h * 0.05,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(80),
            ),
            child: Center(
              child: Row(
                children: [
                  Container(
                    width: w * 0.1,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xffEBECFF),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.lock_outline, color: Color(0xff9F9DF3)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff191C32),
                minimumSize: Size(w * 0.8, 50),
              ),
              onPressed: () {},
              child: Text(
                "Register",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      Assets.images.web3wallet.walletFacebook.path,
                    ),
                  ),
                  Container(
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      Assets.images.web3wallet.walletGoogle.path,
                    ),
                  ),
                  Container(
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      Assets.images.web3wallet.walletApple.path,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
