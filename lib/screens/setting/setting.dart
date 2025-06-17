import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: Color(0xFFFCEDD6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: Color(0x00000000),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IntrinsicHeight(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 206),
                          width: double.infinity,
                          child: Stack(clipBehavior: Clip.none, children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IntrinsicHeight(
                                    child: Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 92),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/14dazotm_expires_30_days.png"),
                                            fit: BoxFit.cover),
                                      ),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            IntrinsicHeight(
                                              child: Container(
                                                color: Color(0xFFFFFFFF),
                                                padding: const EdgeInsets.only(
                                                    top: 9,
                                                    bottom: 9,
                                                    left: 35,
                                                    right: 19),
                                                margin: const EdgeInsets.only(
                                                    bottom: 20),
                                                width: double.infinity,
                                                child: Row(children: [
                                                  IntrinsicWidth(
                                                    child: IntrinsicHeight(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(right: 3),
                                                        child: Row(children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 2),
                                                            child: Text(
                                                              "9",
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFF000000),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 3),
                                                            child: Text(
                                                              ":",
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFF000000),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "41",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF000000),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ]),
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
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 8),
                                                      width: 18,
                                                      height: 10,
                                                      child: Image.network(
                                                        "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/d41eljzr_expires_30_days.png",
                                                        fit: BoxFit.fill,
                                                      )),
                                                  Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 8),
                                                      width: 16,
                                                      height: 11,
                                                      child: Image.network(
                                                        "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/3zr7douo_expires_30_days.png",
                                                        fit: BoxFit.fill,
                                                      )),
                                                  Container(
                                                      width: 24,
                                                      height: 12,
                                                      child: Image.network(
                                                        "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/rf7llccn_expires_30_days.png",
                                                        fit: BoxFit.fill,
                                                      )),
                                                ]),
                                              ),
                                            ),
                                            IntrinsicHeight(
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 20,
                                                    left: 1,
                                                    right: 1),
                                                width: double.infinity,
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      IntrinsicHeight(
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 18),
                                                          margin:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      12),
                                                          width:
                                                              double.infinity,
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                IntrinsicWidth(
                                                                  child:
                                                                      IntrinsicHeight(
                                                                    child:
                                                                        Container(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              2,
                                                                          bottom:
                                                                              2,
                                                                          right:
                                                                              3),
                                                                      child: Row(
                                                                          children: [
                                                                            Container(
                                                                                width: 24,
                                                                                height: 24,
                                                                                child: Image.network(
                                                                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/oeitp1hv_expires_30_days.png",
                                                                                  fit: BoxFit.fill,
                                                                                )),
                                                                            Text(
                                                                              "Kembali",
                                                                              style: TextStyle(
                                                                                color: Color(0xFFFFFFFF),
                                                                                fontSize: 12,
                                                                              ),
                                                                            ),
                                                                          ]),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          bottom:
                                                                              1),
                                                                  child: Text(
                                                                    "Setting",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFFFFFFFF),
                                                                      fontSize:
                                                                          24,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                    width: 36,
                                                                    height: 36,
                                                                    child: Image
                                                                        .network(
                                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/ci69xm2l_expires_30_days.png",
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    )),
                                                              ]),
                                                        ),
                                                      ),
                                                      IntrinsicHeight(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 12,
                                                                  bottom: 12,
                                                                  left: 16,
                                                                  right: 16),
                                                          margin:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      12),
                                                          width:
                                                              double.infinity,
                                                          child: Row(children: [
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                ),
                                                                margin:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            19),
                                                                width: 62,
                                                                height: 62,
                                                                child:
                                                                    ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                12),
                                                                        child: Image
                                                                            .network(
                                                                          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/nzytoann_expires_30_days.png",
                                                                          fit: BoxFit
                                                                              .fill,
                                                                        ))),
                                                            Expanded(
                                                              child:
                                                                  IntrinsicHeight(
                                                                child:
                                                                    Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          right:
                                                                              12),
                                                                  width: double
                                                                      .infinity,
                                                                  child: Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          margin: const EdgeInsets
                                                                              .only(
                                                                              bottom: 4),
                                                                          child:
                                                                              Text(
                                                                            "Arion",
                                                                            style:
                                                                                TextStyle(
                                                                              color: Color(0xFFFFFFFF),
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          "arion@gmail.com",
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Color(0xFFE9EDF7),
                                                                            fontSize:
                                                                                10,
                                                                          ),
                                                                        ),
                                                                      ]),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                ),
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                12),
                                                                        child: Image
                                                                            .network(
                                                                          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/ln5880p2_expires_30_days.png",
                                                                          fit: BoxFit
                                                                              .fill,
                                                                        ))),
                                                          ]),
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 13),
                                              child: Text(
                                                "Pengaturan Aplikasi",
                                                style: TextStyle(
                                                  color: Color(0xFF2B4F6E),
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ]),
                            Positioned(
                              bottom: 0,
                              left: 13,
                              right: 13,
                              child: IntrinsicHeight(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xFFFFFFFF),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x40000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  transform:
                                      Matrix4.translationValues(0, 194, 0),
                                  width: double.infinity,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        IntrinsicHeight(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 14,
                                                bottom: 21,
                                                left: 16,
                                                right: 16),
                                            width: double.infinity,
                                            child: Row(children: [
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 22),
                                                  width: 33,
                                                  height: 33,
                                                  child: Image.network(
                                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/m3w2p9bi_expires_30_days.png",
                                                    fit: BoxFit.fill,
                                                  )),
                                              Expanded(
                                                child: IntrinsicHeight(
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 12),
                                                    width: double.infinity,
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom: 4),
                                                            child: Text(
                                                              "Informasi Pribadi",
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFF404040),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Informasi akun kamu",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF999999),
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                        ]),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  width: 20,
                                                  height: 20,
                                                  child: Image.network(
                                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/7m605a4w_expires_30_days.png",
                                                    fit: BoxFit.fill,
                                                  )),
                                            ]),
                                          ),
                                        ),
                                        IntrinsicHeight(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 20,
                                                left: 16,
                                                right: 16),
                                            width: double.infinity,
                                            child: Row(children: [
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 22),
                                                  width: 33,
                                                  height: 33,
                                                  child: Image.network(
                                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/bebon9na_expires_30_days.png",
                                                    fit: BoxFit.fill,
                                                  )),
                                              IntrinsicWidth(
                                                child: IntrinsicHeight(
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 4),
                                                          child: Text(
                                                            "Notifikasi",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF404040),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          "Pengaturan pemberitahuan",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF999999),
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: double.infinity,
                                                  child: SizedBox(),
                                                ),
                                              ),
                                              Container(
                                                  width: 20,
                                                  height: 20,
                                                  child: Image.network(
                                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/3rng3uv7_expires_30_days.png",
                                                    fit: BoxFit.fill,
                                                  )),
                                            ]),
                                          ),
                                        ),
                                        IntrinsicHeight(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 21,
                                                left: 16,
                                                right: 16),
                                            width: double.infinity,
                                            child: Row(children: [
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 22),
                                                  width: 33,
                                                  height: 33,
                                                  child: Image.network(
                                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/h96zfdzs_expires_30_days.png",
                                                    fit: BoxFit.fill,
                                                  )),
                                              IntrinsicWidth(
                                                child: IntrinsicHeight(
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 4),
                                                          child: Text(
                                                            "Privasi",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF404040),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          "Kebijakan kami",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF999999),
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: double.infinity,
                                                  child: SizedBox(),
                                                ),
                                              ),
                                              Container(
                                                  width: 20,
                                                  height: 20,
                                                  child: Image.network(
                                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/fzi7djmv_expires_30_days.png",
                                                    fit: BoxFit.fill,
                                                  )),
                                            ]),
                                          ),
                                        ),
                                        IntrinsicHeight(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 14,
                                                left: 16,
                                                right: 16),
                                            width: double.infinity,
                                            child: Row(children: [
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 22),
                                                  width: 33,
                                                  height: 33,
                                                  child: Image.network(
                                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/wrjq0gvy_expires_30_days.png",
                                                    fit: BoxFit.fill,
                                                  )),
                                              Expanded(
                                                child: IntrinsicHeight(
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 12),
                                                    width: double.infinity,
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom: 4),
                                                            child: Text(
                                                              "Kentuan",
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFF404040),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Ketentua Layanan kami",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF999999),
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                        ]),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  width: 20,
                                                  height: 20,
                                                  child: Image.network(
                                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/p49uwp5y_expires_30_days.png",
                                                    fit: BoxFit.fill,
                                                  )),
                                            ]),
                                          ),
                                        ),
                                        IntrinsicHeight(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 12,
                                                left: 16,
                                                right: 16),
                                            width: double.infinity,
                                            child: Row(children: [
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 24),
                                                  width: 33,
                                                  height: 33,
                                                  child: Image.network(
                                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/k76rl55f_expires_30_days.png",
                                                    fit: BoxFit.fill,
                                                  )),
                                              Expanded(
                                                child: IntrinsicHeight(
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 12),
                                                    width: double.infinity,
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom: 4),
                                                            child: Text(
                                                              "Ganti Password",
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFF404040),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Atur kembali password akun",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF999999),
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                        ]),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  width: 20,
                                                  height: 20,
                                                  child: Image.network(
                                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/gvwxx8md_expires_30_days.png",
                                                    fit: BoxFit.fill,
                                                  )),
                                            ]),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 12, left: 13),
                        child: Text(
                          "Lainnya",
                          style: TextStyle(
                            color: Color(0xFF2B4F6E),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      IntrinsicHeight(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFFFFFFF),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x40000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          margin: const EdgeInsets.only(
                              bottom: 20, left: 13, right: 13),
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IntrinsicHeight(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 15, left: 16, right: 16),
                                    width: double.infinity,
                                    child: Row(children: [
                                      Container(
                                          margin:
                                              const EdgeInsets.only(right: 22),
                                          width: 33,
                                          height: 33,
                                          child: Image.network(
                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/90riwkzw_expires_30_days.png",
                                            fit: BoxFit.fill,
                                          )),
                                      Expanded(
                                        child: IntrinsicHeight(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 12),
                                            width: double.infinity,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 4),
                                                    child: Text(
                                                      "Bantuan",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF404040),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "Pusat panduan pengguna",
                                                    style: TextStyle(
                                                      color: Color(0xFF999999),
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          width: 20,
                                          height: 20,
                                          child: Image.network(
                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/08oln73j_expires_30_days.png",
                                            fit: BoxFit.fill,
                                          )),
                                    ]),
                                  ),
                                ),
                                IntrinsicHeight(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    width: double.infinity,
                                    child: Row(children: [
                                      Container(
                                          margin:
                                              const EdgeInsets.only(right: 22),
                                          width: 33,
                                          height: 33,
                                          child: Image.network(
                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/032rhtnn_expires_30_days.png",
                                            fit: BoxFit.fill,
                                          )),
                                      Expanded(
                                        child: IntrinsicHeight(
                                          child: Container(
                                            width: double.infinity,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 4),
                                                    child: Text(
                                                      "Version",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF404040),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "1.0.1",
                                                    style: TextStyle(
                                                      color: Color(0xFF999999),
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      IntrinsicHeight(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 195),
                          width: double.infinity,
                          child: Column(children: [
                            InkWell(
                              onTap: () {
                                print('Pressed');
                              },
                              child: IntrinsicWidth(
                                child: IntrinsicHeight(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      color: Color(0xFF4B2C20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x40000000),
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                        left: 127,
                                        right: 127),
                                    child: Row(children: [
                                      Container(
                                        margin: const EdgeInsets.only(right: 7),
                                        child: Text(
                                          "Keluar",
                                          style: TextStyle(
                                            color: Color(0xFFF6F2ED),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                          ),
                                          width: 16,
                                          height: 16,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(22),
                                              child: Image.network(
                                                "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/0zcnr7il_expires_30_days.png",
                                                fit: BoxFit.fill,
                                              ))),
                                    ]),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
