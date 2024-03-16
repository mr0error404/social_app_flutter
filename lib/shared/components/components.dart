import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/shared/style/icon_broken.dart';

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
    
Widget defaultAppBar(
  BuildContext context, {
  String? title,
  List<Widget>? actions,
}) =>
    AppBar(
      
      title: Text(
        "$title",
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          IconBroken.Arrow___Left_2,
        ),
      ),
      actions: actions,
    );

Widget defaultButton({
  double rid = 20.0,
  Color colorText = Colors.white,
  bool uperCase = true,
  required String text,
  required double width,
  required Color back,
  required Function() function,
  double height = 40.0,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rid),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        onPressed: function,
        // ignore: sort_child_properties_last
        child: Text(
          uperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: colorText,
          ),
        ),
        color: back,
      ),
    );

Widget defaultTextButton({
  Color? color,
  required Function() function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(text),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

Widget defaultFormField({
  required TextEditingController textEditingController,
  required IconData prefix,
  required TextInputType type,
  Function(String)? onChanged,
  Function(String)? onSubmitted,
  bool isEnabeld = true,
  Function()? onTap,
  required String? Function(String?)? validation,
  required String label,
  bool isPassword = false,
  IconData? sufixs,
  Function()? sufixFunction,
  double circular = 30.0,
}) =>
    TextFormField(
      // cursorColor: HexColor("#FFBF2F"),
      validator: validation,
      controller: textEditingController,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        // focusColor: HexColor("#FFBF2F"),
        // hoverColor: HexColor("#FFBF2F"),
        // fillColor: HexColor("#FFBF2F"),

        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: sufixs != null
            ? IconButton(
                icon: Icon(sufixs),
                onPressed: sufixFunction,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(circular),
        ),
      ),
      obscureText: isPassword,
      onTap: onTap,
      enabled: isEnabeld,
    );

void ShowToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );
