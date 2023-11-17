import 'package:flutter/material.dart';
import 'package:ypli_apps/utils/custom_input_textfield.dart';
import 'package:ypli_apps/utils/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool showPassword = true;
  bool valueCheck = false;
  dynamic validationPassword = [];
  final passwordfieldkey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        SizedBox(
          height: 24,
        ),
        Image.asset(
          'assets/logo/logo_ypli.png',
          height: 128,
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
                  'Create Your Account',
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
                  'Pastikan informasi yang anda berikan benar, agar kami mudah menginformasikan anda.',
                  style: blackReg400.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Email',
                textAlign: TextAlign.left,
                style: blackBold.copyWith(fontSize: 16),
              ),
              CustomInputText(
                  controllerName: email,
                  placeholder: 'youremail@gmail.com',
                  enabled: true,
                  onChangeText: () {},
                  onTap: () {},
                  onEditingComplete: (v) {
                    print(v);
                  }),
              SizedBox(
                height: 20,
              ),
              Text(
                'Password',
                textAlign: TextAlign.left,
                style: blackBold.copyWith(fontSize: 16),
              ),
              CustomInputText(
                key: passwordfieldkey,
                controllerName: password,
                placeholder: 'Password',
                enabled: true,
                isObsecure: showPassword,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: showPassword
                      ? Icon(
                          Icons.visibility_off,
                          color: primary500,
                        )
                      : Icon(
                          Icons.remove_red_eye,
                          color: primary500,
                        ),
                ),
                onChangeText: (v) {
                  print(v);
                  if (RegExp(".*[0-9].*").hasMatch(v ?? '')) {
                    setState(() {
                      validationPassword = [
                        {'title': 'angka'}
                      ];
                    });
                    print(validationPassword);
                  }
                  if (RegExp('.*[a-z].*').hasMatch(v ?? '')) {
                    setState(() {
                      if (validationPassword.isNotEmpty) {
                        validationPassword.add({'title': 'huruf'});
                      } else {
                        validationPassword = [
                          {'title': 'huruf'}
                        ];
                      }
                    });
                    print(validationPassword);
                  }
                },
                onTap: () {},
                onEditingComplete: (v) {},
                validator: (v) {},
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: valueCheck,
                          activeColor: primary500,
                          onChanged: ((value) {
                            setState(() {
                              valueCheck = value!;
                            });
                          }),
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Remember me',
                        style: blackReg400.copyWith(fontSize: 16),
                      )
                    ],
                  ),
                  Text(
                    'Forgot Password?',
                    style: blackReg400.copyWith(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dashed,
                        color: primary400),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  print(validationPassword);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: primary500,
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style:
                        blackBold.copyWith(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: neutral400,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Belum punya akun?',
                    style: blackReg400,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: neutral400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: primary700),
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    'Register',
                    textAlign: TextAlign.center,
                    style: blackBold.copyWith(color: primary700, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
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
                    style:
                        blackBold.copyWith(color: Colors.white, fontSize: 20),
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
        ])
      ]),
    );
  }
}
