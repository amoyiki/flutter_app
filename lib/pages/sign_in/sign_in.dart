import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutternews/common/utils/screen.dart';
import 'package:flutternews/common/utils/utils.dart';
import 'package:flutternews/common/values/colors.dart';
import 'package:flutternews/common/values/values.dart';
import 'package:flutternews/common/widget/input.dart';
import 'package:flutternews/common/widget/widget.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // email 控制器
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  // 跳转注册页
  _handleNavSignUp() {
    Navigator.pushNamed(context, "/sign-up");
  }

  // 执行登录
  _handleSignIn() {
    if (!duIsEmail(_emailController.value.text)) {
      toastInfo(msg: "请输入正确邮箱");
      return;
    }
    if (!duCheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: "密码不能小于6位");
      return;
    }
  }

  /// logo
  Widget _buildLogo() {
    return Container(
      width: duSetWidth(110),
      margin: EdgeInsets.only(top: duSetHeight(84)),
      child: Column(
        ///
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: duSetHeight(76),
            width: duSetWidth(76),

            /// 横向水平margin
            margin: EdgeInsets.symmetric(horizontal: duSetWidth(15)),

            /// 类似绝对定位，配合 Positioned 组件使用
            child: Stack(
              alignment: Alignment.center,
              children: [
                ///
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    height: duSetWidth(76),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      boxShadow: [
                        Shadows.primaryShadow,
                      ],

                      /// 圆角为父框的50%
                      borderRadius: BorderRadius.all(
                          Radius.circular(duSetWidth(76 * 0.5)) //父容器50%
                          ),
                    ),
                    child: Container(),
                  ),
                ),
                Positioned(
                  top: duSetWidth(13),
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.none,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Text(
              "SECTOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: duSetFontSize(24),
                height: 1,
              ),
            ),
          ),
          Text(
            "news",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  /// 登录表单
  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(top: duSetHeight(49)),
      child: Column(
        children: [
          // email input
          inputTextEdit(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            marginTop: 0,
          ),
          // password input
          inputTextEdit(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "password",
            isPassword: true,
          ),

          /// 注册
          Container(
            height: duSetHeight(44),
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Row(
              children: [
                btnFlatButtonWidget(
                  onPressed: _handleNavSignUp,
                  gbColor: AppColors.thirdElement,
                  title: "Sign Up",
                ),
                Spacer(),
                // 登录
                btnFlatButtonWidget(
                  onPressed: _handleSignIn,
                  gbColor: AppColors.primaryElement,
                  title: "Sign In",
                ),
              ],
            ),
          ),
          // Spacer(),
          Container(
            height: duSetHeight(22),
            margin: EdgeInsets.only(top: duSetHeight(20)),
            child: FlatButton(
              onPressed: () => {},
              child: Text(
                "Fogot password?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: duSetHeight(16),
                  height: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 第三方登录
  Widget _buildThirdPartLogin() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(bottom: duSetHeight(40)),
      child: Column(
        children: [
          // title
          Text(
            "Or sign in with social networks",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: duSetHeight(20)),
            child: Row(
              children: [
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () => {},
                  width: 88,
                  iconFileName: "twitter",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () => {},
                  width: 88,
                  iconFileName: "google",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () => {},
                  width: 88,
                  iconFileName: "facebook",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 注册按钮
  Widget _buildSignupButton() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: btnFlatButtonWidget(
        onPressed: _handleNavSignUp,
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "Sign up",
        fontWeight: FontWeight.w500,
        fontSize: 16
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //设置字体大小根据系统的“字体大小”辅助选项来进行缩放,默认为false
    ScreenUtil.init(context, width: 375, height: 734, allowFontScaling: true);
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          _buildLogo(),
          _buildInputForm(),
          _buildThirdPartLogin(),
          _buildSignupButton(),
        ]),
      ),
    );
  }
}
