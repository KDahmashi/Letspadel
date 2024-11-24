import 'package:padel/core/extensions/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



typedef ResponsiveBuilder = Widget Function(BuildContext context);

class ResponsiveSafeArea extends StatelessWidget {

  ResponsiveSafeArea({
    required ResponsiveBuilder builder,
    super.key,
    Color? color,
    bool? bottom,
    // bool? reverse,
    bool? showLinearGradient,
    required BuildContext context,
    this.uiOverlayStyle,
  }) : responsiveBuilder = builder,
        colorContainer = color ?? context.theme.colorScheme.surface,
        allowBottom = bottom ?? false;
  final ResponsiveBuilder responsiveBuilder;
  final SystemUiOverlayStyle? uiOverlayStyle;
  final Color colorContainer;
  final bool allowBottom;
  // final bool reverse;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: uiOverlayStyle ?? SystemUiOverlayStyle.dark,
      child: Container(
        color: colorContainer,
        child: SafeArea(
          bottom: allowBottom,
          child: responsiveBuilder(context),
        ),
      ),
    );
  }
}