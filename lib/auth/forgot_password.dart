import 'package:flutter/material.dart';
import 'package:ypli_apps/utils/custom_input_textfield.dart';
import 'package:ypli_apps/utils/theme.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController nomorHpCtrl = TextEditingController();
  bool showPassword = true;
  bool nomorHp = false;

  String? selectedValue;
  void radioTileOnChanged(String? val) {
    setState(() {
      selectedValue = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Kembali Login',
          style: blackBold.copyWith(color: primary700, fontSize: 16),
        ),
        leading: Container(
          margin: EdgeInsets.only(left: 16),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(shape: BoxShape.circle, color: primary50),
          child: Icon(
            Icons.arrow_back,
            color: primary700,
            size: 24,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(children: [
            SizedBox(
              height: 24,
            ),
            Container(
              width: 54,
              height: 54,
              padding: EdgeInsets.all(12),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: primary50),
              child: Icon(
                Icons.lock,
                color: primary500,
                size: 24,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Lupa Password',
                      style: blackBold.copyWith(
                        color: primary600,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: Text(
                      'Masukkan alamat email akun anda',
                      style: blackReg400.copyWith(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    nomorHp ? 'Nomor HP' : 'Email',
                    textAlign: TextAlign.left,
                    style: blackBold.copyWith(fontSize: 16),
                  ),
                  CustomInputText(
                      controllerName: nomorHp ? emailCtrl : nomorHpCtrl,
                      placeholder:
                          nomorHp ? 'Masukan Nomor HP' : 'youremail@gmail.com',
                      enabled: true,
                      onChangeText: () {},
                      onTap: () {},
                      onEditingComplete: (v) {
                        print(v);
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: primary500,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        'Submit',
                        textAlign: TextAlign.center,
                        style: blackBold.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (nomorHp == true) {
                          nomorHp = false;
                        } else {
                          nomorHp = true;
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                        nomorHp ? 'Gunakan Email' : 'Gunakan Nomor HP',
                        textAlign: TextAlign.center,
                        style: blackReg400.copyWith(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.dashed,
                            color: primary600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(children: [
                  Image.asset('assets/images/footer.png'),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 42, top: 42, left: 16, right: 16),
                      child: Column(
                        children: [
                          Text(
                            'Contact Information',
                            style: blackBold.copyWith(
                                color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                              'If you have problem with LOGIN or have any question, please contact us.',
                              textAlign: TextAlign.center,
                              style: blackReg400.copyWith(color: Colors.white)),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: secondary500,
                                      borderRadius: BorderRadius.circular(99)),
                                  child: Image.asset(
                                    'assets/images/instagram.png',
                                    width: 32,
                                  )),
                              SizedBox(
                                width: 24,
                              ),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: secondary500,
                                      borderRadius: BorderRadius.circular(99)),
                                  child: Image.asset(
                                    'assets/images/mail.png',
                                    width: 32,
                                  )),
                              SizedBox(
                                width: 24,
                              ),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: secondary500,
                                      borderRadius: BorderRadius.circular(99)),
                                  child: Image.asset(
                                    'assets/images/wa.png',
                                    width: 32,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
