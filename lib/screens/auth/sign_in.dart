import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  String textField1 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: Color(0xFFFCEDD6),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IntrinsicHeight(
                          child: Container(
                            color: Color(0xFFFFFFFF),
                            padding: const EdgeInsets.only(
                              top: 9,
                              bottom: 9,
                              left: 35,
                              right: 20,
                            ),
                            width: double.infinity,
                            child: Row(
                              children: [
                                IntrinsicWidth(
                                  child: IntrinsicHeight(
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                              right: 2,
                                            ),
                                            child: Text(
                                              "9",
                                              style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                              right: 3,
                                            ),
                                            child: Text(
                                              ":",
                                              style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "41",
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    child: SizedBox(),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  width: 18,
                                  height: 10,
                                  child: Image.network(
                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/p3bkx9fc_expires_30_days.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  width: 16,
                                  height: 11,
                                  child: Image.network(
                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/uiomx4ss_expires_30_days.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  width: 24,
                                  height: 12,
                                  child: Image.network(
                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/5i5yy4wr_expires_30_days.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IntrinsicHeight(
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 24,
                              bottom: 170,
                            ),
                            margin: const EdgeInsets.only(bottom: 20),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IntrinsicWidth(
                                  child: IntrinsicHeight(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        bottom: 48,
                                        left: 24,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                              bottom: 40,
                                            ),
                                            width: 40,
                                            height: 40,
                                            child: Image.network(
                                              "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/etinbvb3_expires_30_days.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          IntrinsicWidth(
                                            child: IntrinsicHeight(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                          bottom: 10,
                                                        ),
                                                    child: Text(
                                                      "Welcome Back!",
                                                      style: TextStyle(
                                                        color: Color(
                                                          0xFF121926,
                                                        ),
                                                        fontSize: 32,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 375,
                                                    child: Text(
                                                      "Sign in to track your orders, manage your wishlist, and shop your favorite items anytime.",
                                                      style: TextStyle(
                                                        color: Color(
                                                          0xFF121926,
                                                        ),
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: IntrinsicHeight(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        bottom: 48,
                                        left: 24,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          IntrinsicWidth(
                                            child: IntrinsicHeight(
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                  bottom: 24,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                            bottom: 10,
                                                          ),
                                                      child: Text(
                                                        "Email",
                                                        style: TextStyle(
                                                          color: Color(
                                                            0xFF121926,
                                                          ),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    IntrinsicWidth(
                                                      child: IntrinsicHeight(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                              color: Color(
                                                                0xFF121926,
                                                              ),
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  64,
                                                                ),
                                                            color: Color(
                                                              0xFFFFFFFF,
                                                            ),
                                                          ),
                                                          padding:
                                                              const EdgeInsets.only(
                                                                top: 10,
                                                                bottom: 10,
                                                                left: 16,
                                                                right: 16,
                                                              ),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                margin:
                                                                    const EdgeInsets.only(
                                                                      right: 12,
                                                                    ),
                                                                width: 20,
                                                                height: 20,
                                                                child: Image.network(
                                                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/tqc72ur1_expires_30_days.png",
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                              IntrinsicHeight(
                                                                child: Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  width: 137,
                                                                  child: TextField(
                                                                    style: TextStyle(
                                                                      color: Color(
                                                                        0xFF364152,
                                                                      ),
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                    onChanged: (value) {
                                                                      setState(() {
                                                                        textField1 =
                                                                            value;
                                                                      });
                                                                    },
                                                                    decoration: InputDecoration(
                                                                      hintText:
                                                                          "Input your email here",
                                                                      isDense:
                                                                          true,
                                                                      contentPadding:
                                                                          EdgeInsets.symmetric(
                                                                            vertical:
                                                                                0,
                                                                          ),
                                                                      border: InputBorder
                                                                          .none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          IntrinsicWidth(
                                            child: IntrinsicHeight(
                                              child: Column(
                                                children: [
                                                  IntrinsicWidth(
                                                    child: IntrinsicHeight(
                                                      child: Container(
                                                        margin:
                                                            const EdgeInsets.only(
                                                              bottom: 10,
                                                            ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets.only(
                                                                    bottom: 10,
                                                                  ),
                                                              child: Text(
                                                                "Password",
                                                                style: TextStyle(
                                                                  color: Color(
                                                                    0xFF121926,
                                                                  ),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                print(
                                                                  'Pressed',
                                                                );
                                                              },
                                                              child: IntrinsicWidth(
                                                                child: IntrinsicHeight(
                                                                  child: Container(
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                        color: Color(
                                                                          0xFF121926,
                                                                        ),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            64,
                                                                          ),
                                                                      color: Color(
                                                                        0xFFFFFFFF,
                                                                      ),
                                                                    ),
                                                                    padding: const EdgeInsets.only(
                                                                      top: 10,
                                                                      bottom:
                                                                          10,
                                                                      left: 16,
                                                                      right: 16,
                                                                    ),
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          margin: const EdgeInsets.only(
                                                                            right:
                                                                                12,
                                                                          ),
                                                                          width:
                                                                              20,
                                                                          height:
                                                                              20,
                                                                          child: Image.network(
                                                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/2vrfu63u_expires_30_days.png",
                                                                            fit:
                                                                                BoxFit.fill,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          margin: const EdgeInsets.only(
                                                                            right:
                                                                                254,
                                                                          ),
                                                                          child: Text(
                                                                            "********",
                                                                            style: TextStyle(
                                                                              color: Color(
                                                                                0xFF364152,
                                                                              ),
                                                                              fontSize: 14,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              20,
                                                                          height:
                                                                              20,
                                                                          child: Image.network(
                                                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/1vqf7sfp_expires_30_days.png",
                                                                            fit:
                                                                                BoxFit.fill,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  IntrinsicWidth(
                                                    child: IntrinsicHeight(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets.only(
                                                              right: 3,
                                                            ),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            IntrinsicWidth(
                                                              child: IntrinsicHeight(
                                                                child: Container(
                                                                  padding:
                                                                      const EdgeInsets.only(
                                                                        right:
                                                                            3,
                                                                      ),
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          border: Border.all(
                                                                            color: Color(
                                                                              0xFF121926,
                                                                            ),
                                                                            width:
                                                                                1,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                4,
                                                                              ),
                                                                          color: Color(
                                                                            0xFFFFFFFF,
                                                                          ),
                                                                        ),
                                                                        margin: const EdgeInsets.only(
                                                                          right:
                                                                              8,
                                                                        ),
                                                                        width:
                                                                            16,
                                                                        height:
                                                                            16,
                                                                        child:
                                                                            SizedBox(),
                                                                      ),
                                                                      Text(
                                                                        "Remember me",
                                                                        style: TextStyle(
                                                                          color: Color(
                                                                            0xFF121926,
                                                                          ),
                                                                          fontSize:
                                                                              14,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 120,
                                                              child: SizedBox(),
                                                            ),
                                                            Text(
                                                              "Forgot Password",
                                                              style: TextStyle(
                                                                color: Color(
                                                                  0xFFFF6B57,
                                                                ),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: IntrinsicHeight(
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 24),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          IntrinsicWidth(
                                            child: IntrinsicHeight(
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                  bottom: 32,
                                                ),
                                                child: Column(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        print('Pressed');
                                                      },
                                                      child: IntrinsicWidth(
                                                        child: IntrinsicHeight(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        64,
                                                                      ),
                                                                  color: Color(
                                                                    0xFF7B5347,
                                                                  ),
                                                                ),
                                                            padding:
                                                                const EdgeInsets.only(
                                                                  top: 12,
                                                                  bottom: 12,
                                                                  left: 174,
                                                                  right: 174,
                                                                ),
                                                            margin:
                                                                const EdgeInsets.only(
                                                                  bottom: 16,
                                                                ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Login",
                                                                  style: TextStyle(
                                                                    color: Color(
                                                                      0xFFE3E8EF,
                                                                    ),
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      "Don’t have account yet? Sign Up",
                                                      style: TextStyle(
                                                        color: Color(
                                                          0xFF364152,
                                                        ),
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          IntrinsicWidth(
                                            child: IntrinsicHeight(
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                  bottom: 32,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      color: Color(0xFF121926),
                                                      margin:
                                                          const EdgeInsets.only(
                                                            right: 24,
                                                          ),
                                                      width: 79,
                                                      height: 1,
                                                      child: SizedBox(),
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                            right: 26,
                                                          ),
                                                      child: Text(
                                                        "You can try another method",
                                                        style: TextStyle(
                                                          color: Color(
                                                            0xFF364152,
                                                          ),
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      color: Color(0xFF121926),
                                                      width: 79,
                                                      height: 1,
                                                      child: SizedBox(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          IntrinsicWidth(
                                            child: IntrinsicHeight(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      print('Pressed');
                                                    },
                                                    child: IntrinsicWidth(
                                                      child: IntrinsicHeight(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  64,
                                                                ),
                                                            color: Color(
                                                              0xFF1977F3,
                                                            ),
                                                          ),
                                                          padding:
                                                              const EdgeInsets.only(
                                                                top: 10,
                                                                bottom: 10,
                                                                left: 13,
                                                                right: 13,
                                                              ),
                                                          margin:
                                                              const EdgeInsets.only(
                                                                right: 10,
                                                              ),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            64,
                                                                          ),
                                                                    ),
                                                                margin:
                                                                    const EdgeInsets.only(
                                                                      right: 9,
                                                                    ),
                                                                width: 24,
                                                                height: 24,
                                                                child: ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        64,
                                                                      ),
                                                                  child: Image.network(
                                                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/wjmrr7cg_expires_30_days.png",
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                "Facebook",
                                                                style: TextStyle(
                                                                  color: Color(
                                                                    0xFFFFFFFF,
                                                                  ),
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      print('Pressed');
                                                    },
                                                    child: IntrinsicWidth(
                                                      child: IntrinsicHeight(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  64,
                                                                ),
                                                            color: Color(
                                                              0xFF000000,
                                                            ),
                                                          ),
                                                          padding:
                                                              const EdgeInsets.only(
                                                                top: 10,
                                                                bottom: 10,
                                                                left: 27,
                                                                right: 27,
                                                              ),
                                                          margin:
                                                              const EdgeInsets.only(
                                                                right: 10,
                                                              ),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            64,
                                                                          ),
                                                                    ),
                                                                margin:
                                                                    const EdgeInsets.only(
                                                                      right: 8,
                                                                    ),
                                                                width: 24,
                                                                height: 24,
                                                                child: ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        64,
                                                                      ),
                                                                  child: Image.network(
                                                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/k78sk67o_expires_30_days.png",
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                "Apple",
                                                                style: TextStyle(
                                                                  color: Color(
                                                                    0xFFFFFFFF,
                                                                  ),
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      print('Pressed');
                                                    },
                                                    child: IntrinsicWidth(
                                                      child: IntrinsicHeight(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                              color: Color(
                                                                0xFF121926,
                                                              ),
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  64,
                                                                ),
                                                            color: Color(
                                                              0xFFFCFCFD,
                                                            ),
                                                          ),
                                                          padding:
                                                              const EdgeInsets.only(
                                                                top: 10,
                                                                bottom: 10,
                                                                left: 22,
                                                                right: 22,
                                                              ),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            64,
                                                                          ),
                                                                    ),
                                                                margin:
                                                                    const EdgeInsets.only(
                                                                      right: 8,
                                                                    ),
                                                                width: 24,
                                                                height: 24,
                                                                child: ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        64,
                                                                      ),
                                                                  child: Image.network(
                                                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/8vcnmgw4_expires_30_days.png",
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                "Google",
                                                                style: TextStyle(
                                                                  color: Color(
                                                                    0xFF121926,
                                                                  ),
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
