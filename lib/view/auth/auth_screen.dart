import 'package:aamazon/constants/utils/colors.dart';
import 'package:aamazon/widgets/my_box.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool inLogin = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Image(
          image: const AssetImage(
            'assets/images/amazon_logo.png',
          ),
          height: size.height * .03,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .03, vertical: size.height * .02),
          height: size.height,
          width: size.width,
          //alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // welcome row
              Text(
                'Welcome',
                textAlign: TextAlign.start,
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
              ),
              MyBox(
                mHeight: size.height * .02,
              ),
              Container(
                width: size.width,
                decoration:
                    BoxDecoration(border: Border.all(color: greyShade3)),
                child: Column(
                  children: [
                    /// create account container///
                    Container(
                      height: size.height * .06,
                      width: size.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .03),
                      decoration: BoxDecoration(
                          color: greyShade1,
                          border:
                              Border(bottom: BorderSide(color: greyShade3))),
                      child: Row(
                        children: [
                          /// custom checkbox for creating account///
                          Container(
                            height: size.height * .035,
                            width: size.width * .035,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: grey),
                                color: white),
                            alignment: Alignment.center,
                            child: Icon(Icons.circle,
                                size: size.height * .013,
                                color: inLogin ? transparent : secondaryColor),
                          ),
                          MyBox(mWidth: size.width * .02),

                          /// Richtext for create account  and new to amazon?///
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Create Account.  ',
                                    style: textTheme.bodyMedium!
                                        .copyWith(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: 'New to Amazon?',
                                    style: textTheme.bodyLarge!),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyBox(
                      mHeight: size.width * .02,
                    ),

                    /// Sign-in container///
                    Container(
                      height: size.height * .06,
                      width: size.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * .03,
                          vertical: size.height * .01),
                      //  decoration: BoxDecoration(color: greyShade1),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              /// custom checkbox for sign in option
                              Container(
                                height: size.height * .035,
                                width: size.width * .035,
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: grey),
                                    color: white),
                                alignment: Alignment.center,
                                child: Icon(Icons.circle,
                                    size: size.height * .013,
                                    color:
                                        inLogin ? secondaryColor : transparent),
                              ),
                              MyBox(mWidth: size.width * .02),

                              /// Richtext for create account  and new to amazon?///
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'Sign in.  ',
                                        style: textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: 'Already a customer?',
                                        style: textTheme.bodyLarge!),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // create account row

              // sign in row
            ],
          ),
        ),
      ),
    );
  }
}
