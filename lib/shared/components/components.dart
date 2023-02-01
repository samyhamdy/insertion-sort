import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required void Function()? function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  void Function()? onTap,
  bool isPassword = false,
  required String? Function(String?)? validate,
  IconData? suffix,
  void Function()? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );

class MainText extends StatelessWidget {
  final String? txt;
  final double? size;
  final Color? fontColor;
  final bool? linethrougth;
  final bool? bold;

  const MainText(
      {this.txt, this.size, this.fontColor, this.linethrougth, this.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt!,
      textAlign: TextAlign.center,
      style: TextStyle(
          decoration: linethrougth != null
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          fontFamily: bold != null && bold! ? "Cairo-Bold" : "Cairo-Regular",
          fontSize: size ?? 10,
          height: 1.5,
          // fontWeight:
          //     bold != null && bold ? FontWeight.w900 : FontWeight.normal,
          color: this.fontColor ?? Colors.black),
      // GoogleFonts.cairo()
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor,
        radix: 16); //numbers in hexa ---> so radox 16 --> base of 16
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
