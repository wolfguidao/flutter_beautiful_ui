import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/gen/assets.gen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _inputAndButtonController;
  late AnimationController _typeController;
  late Animation<double> _titleAnimation;
  late Animation<double> _usernameAnimation;
  late Animation<double> _emailAnimation;
  late Animation<double> _passwordAnimation;
  late Animation<double> _buttonAnimation;
  late Animation<double> _typeAnimation;

  @override
  void initState() {
    //Init AnimationController
    _titleController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _inputAndButtonController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _typeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    ///Init Title Animation
    _titleAnimation = CurvedAnimation(
      parent: _titleController,
      curve: Curves.easeIn,
    );

    /// Init Input and Button Aimation
    _usernameAnimation = CurvedAnimation(
      parent: _inputAndButtonController,
      curve: Interval(0, 0.25),
    );
    _emailAnimation = CurvedAnimation(
      parent: _inputAndButtonController,
      curve: Interval(0.25, 0.5),
    );
    _passwordAnimation = CurvedAnimation(
      parent: _inputAndButtonController,
      curve: Interval(0.5, 0.75),
    );
    _buttonAnimation = CurvedAnimation(
      parent: _inputAndButtonController,
      curve: Interval(0.75, 1),
    );

    /// Init Login Type Animation
    _typeAnimation = CurvedAnimation(
      parent: _typeController,
      curve: Curves.easeIn,
    );

    /// Start Animation
    _titleController.forward();
    _titleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _inputAndButtonController.forward();
      }
    });
    _inputAndButtonController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _typeController.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _inputAndButtonController.dispose();
    _typeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    return Align(
      alignment: AlignmentGeometry.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo
          Image.asset(Assets.images.web3wallet.walletLoginRobot.path),
          // Titile
          AnimatedBuilder(
            animation: _titleAnimation,
            builder: (builder, child) {
              return Opacity(opacity: _titleAnimation.value, child: child);
            },
            child: Text(
              "Login In",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          SizedBox(height: 10),
          // Username Input
          AnimatedInputWidget(
            animation: _usernameAnimation,
            child: LoginInputWidget(
              width: w * 0.8,
              height: h * 0.05,
              iconSize: w * 0.1,
              iconData: Icons.person_outlined,
              iconBackgroundColor: Color(0xffFFEBE4),
              iconColor: Color(0xfff7931a),
              hintText: "Username",
            ),
          ),
          // Email Input
          AnimatedInputWidget(
            animation: _emailAnimation,
            child: LoginInputWidget(
              width: w * 0.8,
              height: h * 0.05,
              iconSize: w * 0.1,
              iconData: Icons.email_outlined,
              iconBackgroundColor: Color(0xffDEF5E9),
              iconColor: Color(0xff5FC88F),
              hintText: "Email",
            ),
          ),
          // Password Input
          AnimatedInputWidget(
            animation: _passwordAnimation,
            child: LoginInputWidget(
              width: w * 0.8,
              height: h * 0.05,
              iconSize: w * 0.1,
              iconData: Icons.lock_outlined,
              iconBackgroundColor: Color(0xffEBECFF),
              iconColor: Color(0xff9F9DF3),
              hintText: "Password",
              isObscureText: true,
            ),
          ),
          // Login Button
          AnimatedBuilder(
            animation: _buttonAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, 20 * (1 - _buttonAnimation.value)),
                child: Opacity(opacity: _buttonAnimation.value, child: child),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff191C32),
                  minimumSize: Size(w * 0.8, 50),
                ),
                onPressed: () {},
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          // Login Type
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.2),
              child: AnimatedBuilder(
                animation: _typeAnimation,
                builder: (context, child) {
                  return Opacity(opacity: _typeAnimation.value, child: child);
                },
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
          ),
        ],
      ),
    );
  }
}

class LoginInputWidget extends StatelessWidget {
  final double width;
  final double height;
  final double iconSize;
  final IconData iconData;
  final Color iconBackgroundColor;
  final Color iconColor;
  final String hintText;
  final bool isObscureText;
  const LoginInputWidget({
    super.key,
    required this.width,
    required this.height,
    required this.iconSize,
    required this.iconData,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.hintText,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
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
              width: iconSize,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: iconColor),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  obscureText: isObscureText,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedInputWidget extends StatelessWidget {
  final Animation<double> animation;
  final double verticalOffset;
  final Widget child;
  const AnimatedInputWidget({
    super.key,
    required this.animation,
    this.verticalOffset = 20,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, verticalOffset * (1 - animation.value)),
          child: Opacity(opacity: animation.value, child: child),
        );
      },
      child: child,
    );
  }
}
