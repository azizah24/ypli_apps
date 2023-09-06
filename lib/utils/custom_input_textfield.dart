import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/currency_input_formatter.dart';
import 'package:flutter_multi_formatter/formatters/money_input_enums.dart';
import 'package:ypli_apps/utils/theme.dart';

class CustomInputText extends StatefulWidget {
  CustomInputText({
    Key? key,
    required this.controllerName,
    this.hintText = '',
    this.hintStyle =
        const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
    required this.enabled,
    this.isRequired = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.keyboardType = TextInputType.text,
    this.prefix = const SizedBox(),
    this.errorText = '',
    this.errorTextWidget = const SizedBox(),
    this.suffixIcon = const SizedBox(),
    this.inputColor = Colors.white,
    this.textColor = Colors.black,
    this.isObsecure = false,
    this.isHasHint = true,
    this.isPrice = false,
    this.placeholder = '',
    required this.onChangeText,
    required this.onTap,
    this.borderColor = const Color(0xff737373),
    required this.onEditingComplete,
    this.validator,
    this.bintang = false,
    this.hintColor,
    this.isHandOver = false,
  }) : super(key: key);

  TextEditingController controllerName;
  String hintText;
  TextStyle hintStyle;
  String placeholder;
  bool enabled;
  bool isRequired;
  bool isObsecure;
  bool isHasHint;
  bool isPrice;
  bool isHandOver;
  int maxLines;
  int minLines;
  bool bintang;

  TextInputType keyboardType;
  Widget prefix;
  String? errorText;
  Widget suffixIcon;
  Widget? errorTextWidget;
  Color inputColor;
  Color borderColor;
  Color textColor;
  Color? hintColor;
  Function onChangeText;
  Function onTap;
  Function? validator;
  Function onEditingComplete;

  @override
  CustomInputTextState createState() => CustomInputTextState();
}

class CustomInputTextState extends State<CustomInputText> {
  @override
  void initState() {
    textListener();
    super.initState();
  }

  void textListener() {
    widget.controllerName.addListener(() {
      if (widget.isHandOver) {
        widget.onChangeText();
      }
      if (widget.controllerName.text != '') {
        widget.onChangeText();
      }
    });
  }

  @override
  void dispose() {
    widget.controllerName.removeListener(textListener);
    // widget.controllerName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.isHasHint == true &&
                widget.isRequired == true &&
                widget.hintText != ''
            ? Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                                text: widget.hintText, style: widget.hintStyle),
                            TextSpan(
                                text: '\t*',
                                style: blackMed.copyWith(color: red200)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : widget.isHasHint && widget.hintText != ''
                ? Container(
                    padding:
                        const EdgeInsets.only(left: 16, top: 12, bottom: 4),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.hintText,
                      style: widget.hintStyle,
                      // style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
                    ),
                  )
                : const SizedBox(
                    height: 8,
                  ),
        MediaQuery.removePadding(
          context: context,
          removeLeft: true,
          removeBottom: true,
          child: Column(
            children: [
              TextFormField(
                minLines: widget.minLines,
                inputFormatters: [
                  if (widget.isPrice)
                    CurrencyInputFormatter(
                      thousandSeparator: ThousandSeparator.Period,
                      mantissaLength: 0,
                    ),
                ],
                controller: widget.controllerName,
                onTap: () {
                  widget.onTap();
                },
                onFieldSubmitted: (val) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onEditingComplete: () {
                  widget.onEditingComplete();
                },
                enabled: widget.enabled,
                obscureText: widget.isObsecure,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: (widget.textColor != null)
                      ? widget.textColor
                      : neutral300,
                ),
                keyboardType: widget.keyboardType,
                maxLines: widget.maxLines,
                decoration: InputDecoration(
                    isDense: true, //remove default padding
                    fillColor: widget.inputColor,
                    filled: true, // activate bg color
                    // hintText: widget.hintText,
                    hintText: widget.placeholder,
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      color: neutral300,
                    ),
                    prefix: widget.prefix,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: neutral400, width: 0.5)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: widget.borderColor, width: 0.5)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: neutral400, width: 0.5)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: primary400, width: 0.5),
                    ),
                    suffixIcon: widget.suffixIcon),
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              widget.errorTextWidget ??
                  (widget.errorText != null || widget.errorText != ''
                      ? Container(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(widget.errorText ?? '',
                              style: blackReg400.copyWith(color: red200)),
                        )
                      : const SizedBox()),
            ],
          ),
        ),
      ],
    );
  }
}
