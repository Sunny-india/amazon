import 'package:aamazon/constants/utils/colors.dart';
import 'package:aamazon/widgets/my_box.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool inLogin = true;
  String currentCountryCode = '+91';
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstAndLastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: white,
        elevation: 2,
        title: Image(
          image: const AssetImage(
            'assets/images/amazon_logo.png',
          ),
          height: size.height * .04,
        ),
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .03, vertical: size.height * .02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// welcome text
                Text(
                  'Welcome',
                  style: textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                MyBox(
                  mHeight: size.height * .02,
                ),
                Builder(
                  builder: (context) {
                    if (inLogin) {
                      return signInContainer(size, textTheme, context);
                    } else {
                      return createAccountContainer(size, textTheme, context);
                    }
                  },
                ),

                MyBox(mHeight: size.height * .05),

                /// column for bottom containers to hold
                AuthScreenBottomWidget(size: size, textTheme: textTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container signInContainer(
      Size size, TextTheme textTheme, BuildContext context) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(border: Border.all(color: greyShade3)),

      /// containing other informative containers in it
      child: Column(
        children: [
          /// create-account container
          Container(
            height: size.height * .06,
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: size.width * .03),
            decoration: BoxDecoration(
              color: greyShade1,
              border: Border(bottom: BorderSide(color: greyShade3)),
            ),
            child: Row(
              children: [
                /// custom check-box
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = false;
                    });
                  },
                  child: Container(
                    height: size.height * .03,
                    width: size.height * .03,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: grey),
                        color: white),
                    child: Icon(
                      Icons.circle,
                      size: size.height * .015,
                      color: inLogin ? transparent : secondaryColor,
                    ),
                  ),
                ),
                MyBox(mWidth: size.width * .02),

                /// create account and new to amazon text
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Create Account   ',
                          style: textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'New to Amazon?', style: textTheme.bodyMedium!),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// sign-in container
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .03, vertical: size.height * .01),

            /// extra column layer added
            child: Column(
              children: [
                /// sign-in and Already a customer row
                Row(
                  children: [
                    /// custom check-box
                    InkWell(
                      onTap: () {
                        setState(() {
                          /// opposite to the above one
                          inLogin = true;
                        });
                      },
                      child: Container(
                        height: size.height * .03,
                        width: size.height * .03,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: grey),
                            color: white),
                        child: Icon(
                          Icons.circle,
                          size: size.height * .015,

                          /// color too would be working opposite to the above one
                          color: inLogin ? secondaryColor : transparent,
                        ),
                      ),
                    ),
                    MyBox(mWidth: size.width * .02),

                    /// sign-in  and already a customer text
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Sign-in   ',
                          style: textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'Already a Customer?',
                          style: textTheme.bodyMedium!),
                    ])),
                  ],
                ),
                MyBox(mHeight: size.height * .01),

                /// country-picker and add a number textformfield in row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// country-picker container in a InkWell
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            onSelect: (Country country) {
                              setState(() {
                                currentCountryCode = '+${country.phoneCode}';
                              });
                            });
                      },
                      child: Container(
                        width: size.width * .20,
                        height: size.height * .06,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: greyShade2),
                        alignment: Alignment.center,
                        child: Text(
                          currentCountryCode,
                          style: textTheme.displaySmall!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),

                    /// phone textField in a container
                    Container(
                      width: size.width * .66,
                      height: size.height * .06,
                      alignment: Alignment.center,
                      child: TextFormField(
                        cursorColor: black,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Enter Mobile Number',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: grey),
                          ),
                          //
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: secondaryColor),
                          ),
                          //
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: grey),
                          ),
                          //
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: grey),
                          ),
                        ),
                        controller: phoneController,
                        validator: (value) {
                          //todo: validation is to be done
                          // if (value!.isEmpty || value == '') {
                          //   return 'Enter your number';
                          // } else if (currentCountryCode == '+91') {
                          //
                          //   return 'choose Indian Number';
                          // } else {
                          //   return null;
                          // }
                        },
                      ),
                    ),
                  ],
                ),
                MyBox(mHeight: size.height * .02),

                /// Continue button
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * .88, size.height * .06),
                        backgroundColor: amber),
                    onPressed: () {},
                    child: Text(
                      'Continue',
                      style: textTheme.displaySmall!
                          .copyWith(fontWeight: FontWeight.w500),
                    )),
                MyBox(mHeight: size.height * .02),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'By continuing you agree to Amazon\'s ',
                      style: textTheme.labelMedium),
                  TextSpan(
                      text: 'Conditions of Use ',
                      style: textTheme.labelMedium!.copyWith(color: blue)),
                  TextSpan(text: 'and ', style: textTheme.labelMedium),
                  TextSpan(
                      text: 'Privacy Notice',
                      style: textTheme.labelMedium!.copyWith(color: blue)),
                ])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container createAccountContainer(
      Size size, TextTheme textTheme, BuildContext context) {
    /// containing other informative containers in it

    return Container(
      width: size.width,
      decoration: BoxDecoration(border: Border.all(color: greyShade3)),
      child: Column(
        children: [
          /// create account container
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .03, vertical: size.height * .01),
            child: Column(
              children: [
                /// create account and new to amazon row
                Row(
                  children: [
                    /// custom check-box
                    InkWell(
                      onTap: () {
                        setState(() {
                          /// opposite to the above one
                          inLogin = false;
                        });
                      },
                      child: Container(
                        height: size.height * .03,
                        width: size.height * .03,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: grey),
                            color: white),
                        child: Icon(
                          Icons.circle,
                          size: size.height * .015,

                          /// color too would be working opposite to the above one
                          color: inLogin ? transparent : secondaryColor,
                        ),
                      ),
                    ),
                    MyBox(mWidth: size.width * .02),

                    /// create account and new to amazon text
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Create Account  ',
                          style: textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'New to Amazon?', style: textTheme.bodyMedium!),
                    ])),
                  ],
                ),
                MyBox(mHeight: size.height * .01),

                /// TextFormField for first and last name
                SizedBox(
                  height: size.height * .06,
                  child: TextFormField(
                    controller: firstAndLastNameController,
                    decoration: InputDecoration(
                      hintText: 'first and last name',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                      ),
                      //
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey),
                      ),
                      //
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: secondaryColor),
                      ),
                      //
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey),
                      ),
                      //
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey),
                      ),

                      //
                    ),
                  ),
                ),
                MyBox(mHeight: size.height * .01),

                /// country-picker and add a number textformfield in row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// country-picker container in a InkWell
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            onSelect: (Country country) {
                              setState(() {
                                currentCountryCode = '+${country.phoneCode}';
                              });
                            });
                      },
                      child: Container(
                        width: size.width * .20,
                        height: size.height * .06,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: greyShade2),
                        alignment: Alignment.center,
                        child: Text(
                          currentCountryCode,
                          style: textTheme.displaySmall!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),

                    /// TextFormField for phone
                    SizedBox(
                      width: size.width * .66,
                      height: size.height * .06,
                      // alignment: Alignment.center,
                      child: TextFormField(
                        cursorColor: black,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Enter Mobile Number',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: grey),
                          ),
                          //
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: secondaryColor),
                          ),
                          //
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: grey),
                          ),
                          //
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: grey),
                          ),
                        ),
                        controller: phoneController,
                        validator: (value) {
                          //todo: validation is to be done
                          // if (value!.isEmpty || value == '') {
                          //   return 'Enter your number';
                          // } else if (currentCountryCode == '+91') {
                          //
                          //   return 'choose Indian Number';
                          // } else {
                          //   return null;
                          // }
                        },
                      ),
                    ),
                  ],
                ),
                MyBox(mHeight: size.height * .02),

                /// By enrolling condition... text
                Text(
                  'By enrolling your mobile phone number, you consent to receive automate security notifications via test message from Amazon. Message and data rates may apply.',
                  textAlign: TextAlign.justify,
                  style: textTheme.bodyMedium!.copyWith(fontSize: 13),
                ),
                MyBox(mHeight: size.height * .02),

                /// Verify mobile Number button
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * .88, size.height * .06),
                        backgroundColor: amber),
                    onPressed: () {},
                    child: Text(
                      'Verify Mobile Number',
                      style: textTheme.displaySmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    )),
                MyBox(mHeight: size.height * .02),

                /// by continuing... till privacy policy richtext
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'By continuing you agree to Amazon\'s ',
                      style: textTheme.labelMedium),
                  TextSpan(
                      text: 'Conditions of Use ',
                      style: textTheme.labelMedium!.copyWith(color: blue)),
                  TextSpan(text: 'and ', style: textTheme.labelMedium),
                  TextSpan(
                      text: 'Privacy Notice',
                      style: textTheme.labelMedium!.copyWith(color: blue)),
                ])),
              ],
            ),
          ),

          /// sign-in container
          Container(
            height: size.height * .06,
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: size.width * .03),
            decoration: BoxDecoration(
              color: greyShade1,
              border: Border(top: BorderSide(color: greyShade3)),
            ),
            child: Row(
              children: [
                /// custom check-box
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = true;
                    });
                  },
                  child: Container(
                    height: size.height * .03,
                    width: size.height * .03,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: grey),
                        color: white),
                    child: Icon(
                      Icons.circle,
                      size: size.height * .015,
                      color: inLogin ? secondaryColor : transparent,
                    ),
                  ),
                ),
                MyBox(mWidth: size.width * .02),

                /// sign in an already a customer text
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Sign In   ',
                          style: textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'Already a Customer?',
                          style: textTheme.bodyMedium!),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AuthScreenBottomWidget extends StatelessWidget {
  const AuthScreenBottomWidget({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// horizontal line container
        Container(
          height: 1,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [white, greyShade3, white],
            ),
          ),
        ),
        MyBox(mHeight: size.height * .02),

        /// conditions of use, privacy notice, and Help row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Condition Of Use',
              style: textTheme.labelMedium!.copyWith(color: blue),
            ),
            Text(
              'Privacy Notice',
              style: textTheme.labelMedium!.copyWith(color: blue),
            ),
            Text(
              'Help',
              style: textTheme.labelMedium!.copyWith(color: blue),
            ),
          ],
        ),
        MyBox(mHeight: size.height * .01),

        /// amazon copyright text
        Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * .03),
            child: Text(
              '© 1996-2023, Amazon.com. Inc or its affiliates',
              style: textTheme.labelSmall!.copyWith(color: grey, fontSize: 9),
            )),
      ],
    );
  }
}

extension ValidNumber on String {
  bool isValidNumber() {
    return RegExp(r'^[0-9]$').hasMatch(this);
  }
}
