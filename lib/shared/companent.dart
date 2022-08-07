import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future navigetorAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

Future navigetorTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

Widget defultTextForm({
  required TextEditingController textController,
  required TextInputType type,
  Function? onTap,
  Function? onChange,
  Function? onSubmet,
  Function? validator,
  Function? suffixPressed,
  String? lable,
  IconData? prefix,
  IconData? suffix,
  required bool isPass,
}) =>
    TextFormField(
      controller: textController,
      keyboardType: type,
      obscureText: isPass,
      onTap: onTap != null ? onTap() : null,
      onChanged: onChange != null ? (s) => onChange(s) : null,
      onFieldSubmitted: onSubmet != null ? (s) => onSubmet(s) : null,
      validator: (value) => validator!(value),
      decoration: InputDecoration(
        label: Text(lable!),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget defultButton({
  Function? onPressed,
  double width = double.infinity,
  Color backgraound = Colors.blue,
  required String text,
  bool isUppercase = true,
  double radius = 3.0,
}) =>
    Container(
      height: 50,
      width: double.infinity,
      child: MaterialButton(
        onPressed: () {
          onPressed!();
        },
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: backgraound,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
void showTost({required String msg, required TostState state}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: changeColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum TostState { SUCCESS, ERROR, WARNING }

Color changeColor(TostState state) {
  Color color;
  switch (state) {
    case TostState.SUCCESS:
      color = Colors.green;
      break;
    case TostState.ERROR:
      color = Colors.red;
      break;
    case TostState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
