import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyButton extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color? textColor;
  final Color? bgColor;
  final bool loading ;

  const MyButton({
    Key? key,
    required this.title,
    required this.onTap,
   this.loading = false ,
    this.style,
    this.width,
    this.height,
    this.padding,
    this.textColor,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 295,
      height: height ?? 56,
      child: ElevatedButton(
        onPressed: onTap,
        child: Center(child: loading==false? Text(title): LoadingAnimationWidget.inkDrop(
          color: Colors.white,
          size: 30,
        )),
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),
            alignment: Alignment.center,
            textStyle: style ??
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            onPrimary: textColor ??
                Theme.of(context).buttonTheme.colorScheme?.onSecondary,
            primary: bgColor),
      ),
    );
  }
}
