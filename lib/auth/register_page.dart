import 'package:flutter/material.dart';
import 'package:ypli_apps/utils/custom_input_textfield.dart';
import 'package:ypli_apps/utils/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController confirmPassCtrl = TextEditingController();
  bool showPassword = true;
  bool valueCheck = false;
  List validationPassword = [];
  final passwordfieldkey = GlobalKey<FormFieldState>();
  bool numberValid = false, uppCase = false, lowerCase = false, length8 = false;
  List gender = [
    {"title": "Laki - laki", "value": 1},
    {"title": "Perempuan", "value": 2}
  ];

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
    validationPassword = [
      {
        'title': 'Minimal 8 karakter',
        'value': length8,
      },
      {
        'title': 'Satu huruf besar',
        'value': uppCase,
      },
      {
        'title': 'Satu huruf kecil',
        'value': lowerCase,
      },
      {
        'title': 'Satu angka',
        'value': numberValid,
      },
    ];
  }

  validationPasswords() {
    validationPassword = [
      {
        'title': 'Minimal 8 karakter',
        'value': length8,
      },
      {
        'title': 'Satu huruf besar',
        'value': uppCase,
      },
      {
        'title': 'Satu huruf kecil',
        'value': lowerCase,
      },
      {
        'title': 'Satu angka',
        'value': numberValid,
      },
    ];
  }

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
                'Your Name',
                textAlign: TextAlign.left,
                style: blackBold.copyWith(fontSize: 16),
              ),
              CustomInputText(
                  controllerName: nameCtrl,
                  placeholder: 'Your Name',
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
                'Email',
                textAlign: TextAlign.left,
                style: blackBold.copyWith(fontSize: 16),
              ),
              CustomInputText(
                  controllerName: emailCtrl,
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
                'Gender',
                textAlign: TextAlign.left,
                style: blackBold.copyWith(fontSize: 16),
              ),
              Row(
                children: [
                  for (int i = 0; i < gender.length; i++)
                    Expanded(
                      child: RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          value: '${gender[i]['title']}',
                          groupValue: selectedValue,
                          activeColor: primary500,
                          selected: false,
                          dense: true,
                          title: Align(
                              alignment: Alignment(-1.1, 0),
                              child: Text(
                                '${gender[i]['title']}',
                                style: blackReg400.copyWith(fontSize: 16),
                              )),
                          onChanged: (val) {
                            setState(() {
                              // setSelectedlokasi(val);
                              var value = {};
                              radioTileOnChanged(val);
                              print(val);
                            });
                            // statusselect = val![position]['id'];
                          }),
                    ),
                ],
              ),
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
                controllerName: passwordCtrl,
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
                  if (RegExp(".*[0-9].*").hasMatch(v ?? '')) {
                    setState(() {
                      numberValid = true;
                      validationPasswords();
                    });
                  } else {
                    setState(() {
                      numberValid = false;
                      validationPasswords();
                    });
                  }
                  if (RegExp('.*[a-z].*').hasMatch(v ?? '')) {
                    setState(() {
                      lowerCase = true;
                      validationPasswords();
                    });
                  } else {
                    setState(() {
                      lowerCase = false;
                      validationPasswords();
                    });
                  }
                  if (RegExp('.*[A-Z].*').hasMatch(v ?? '')) {
                    setState(() {
                      uppCase = true;
                      validationPasswords();
                    });
                  } else {
                    setState(() {
                      uppCase = false;
                      validationPasswords();
                    });
                  }
                  if (RegExp(r'^.{8,}$').hasMatch(v ?? '')) {
                    setState(() {
                      length8 = true;
                      validationPasswords();
                    });
                  } else {
                    setState(() {
                      length8 = false;
                      validationPasswords();
                    });
                  }
                },
                onTap: () {},
                onEditingComplete: (v) {},
                validator: (v) {},
              ),
              SizedBox(
                height: 20,
              ),
              validationPassword.isEmpty
                  ? Container()
                  : GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 0,
                        childAspectRatio: 5,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: validationPassword.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: validationPassword[index]['value']
                                      ? green200
                                      : neutral200,
                                  border: Border.all(
                                      color: validationPassword[index]['value']
                                          ? green400
                                          : neutral400)),
                              child: Icon(
                                Icons.check,
                                size: 10,
                                color: validationPassword[index]['value']
                                    ? green400
                                    : neutral400,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${validationPassword[index]['title']}',
                              style: blackReg400.copyWith(
                                  fontSize: 14,
                                  color: validationPassword[index]['value']
                                      ? green600
                                      : neutral500),
                            )
                          ],
                        );
                      }),
              SizedBox(
                height: 20,
              ),
              Text(
                'Confirm Password',
                textAlign: TextAlign.left,
                style: blackBold.copyWith(fontSize: 16),
              ),
              CustomInputText(
                  controllerName: confirmPassCtrl,
                  placeholder: 'Confirm Password',
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
                  onChangeText: () {},
                  onTap: () {},
                  onEditingComplete: () {}),
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
                    'Register',
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
                    'Sudah punya akun?',
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
                    'Login',
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
