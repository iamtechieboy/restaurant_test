import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_test/core/util/extensions/extensions.dart';
import 'package:restaurant_test/features/common/presentation/widgets/scale_animation_widget.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color? color;
  final Color textColor;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final GestureTapCallback onTap;
  final BoxBorder? border;
  final double borderRadius;
  final Widget? child;
  final Color disabledColor;
  final bool isDisabled;
  final bool isLoading;
  final double? scaleValue;
  final List<BoxShadow>? shadow;
  final Gradient? gradient;

  const CustomButton({
    required this.onTap,
    this.text = '',
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 8,
    this.disabledColor = Colors.grey,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.textStyle,
    this.border,
    this.child,
    this.scaleValue,
    this.shadow,
    this.gradient,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ScaleAnimationWidget(
        scaleValue: scaleValue ?? 0.98,
        onTap: () {
          if (!(isLoading || isDisabled)) {
            onTap();
          }
        },
        isDisabled: isDisabled,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: width,
          height: height ?? 44,
          margin: margin,
          padding: padding ?? EdgeInsets.zero,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isDisabled ? disabledColor : color,
            borderRadius: BorderRadius.circular(borderRadius),
            border: border,
            boxShadow: shadow,
            gradient: gradient,
          ),
          child: isLoading
              ? const Center(child: CupertinoActivityIndicator(color: Colors.white))
              : AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style:
                      context.textTheme.labelLarge!.copyWith(color: isDisabled ? Colors.grey : textColor),
                  child: Text(
                            text,
                            style: textStyle,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                ),
        ),
      );
}   
      