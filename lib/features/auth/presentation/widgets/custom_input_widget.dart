// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pinput/pinput.dart';
//
// typedef ScreenBuildCall = Function(Widget?);
// typedef Submitted = Function(String?);
// typedef ClickCall = Function();
// typedef PersonalInfoCall = Function(BuildContext);
// typedef SwitchOnChangedCall = Function(bool);
//
//
// class CustomInputWidget extends StatelessWidget {
//   final TextStyle? style;
//   final TextStyle? hintStyle;
//   final String? hintText;
//   final InputBorder? border;
//   final InputBorder? defaultBorder;
//   final InputBorder? focusedBorder;
//   final InputBorder? enabledBorder;
//   final Color? enabledBorderColor;
//   final EdgeInsets? contentPadding;
//   final BoxConstraints? constraints;
//   final BoxConstraints? prefixIconConstraints;
//   final TextEditingController? controller;
//   final TextInputAction? textInputAction;
//   final Submitted? onSubmitted;
//   final Submitted? onCompleted;
//   final ClickCall? onTap;
//   final List<TextInputFormatter>? inputFormatters;
//   final Submitted? onChanged;
//   final ClickCall? passwordVisibleToggle;
//   final Widget? suffixIcon;
//   final TextInputType? keyboardType;
//   final List<String>? autofillHints;
//   final bool autofocus;
//   final double? cursorWidth;
//   final double? cursorHeight;
//   final int? maxLines;
//   final bool isCollapsed;
//   final bool obscureText;
//   final bool readOnly;
//   final bool verificationCode;
//   final PinTheme? defaultPinTheme;
//   final int length;
//   final bool showCursor;
//   final bool? filled;
//   final bool expands;
//   final bool? enabled;
//   final Color? fillColor;
//   final Color? focusColor;
//   final Color? hoverColor;
//
//   final Widget? label;
//   final Widget? icon;
//   final Widget? helper;
//   final Widget? suffix;
//   final Widget? counter;
//   final Widget? error;
//   final Widget? prefixIcon;
//   final Widget? prefix;
//   final FocusNode? focusNode;
//
//   const CustomInputWidget({
//     super.key,
//     this.style,
//     this.hintStyle,
//     this.hintText,
//     this.border,
//     this.expands = false,
//     this.defaultBorder,
//     this.focusedBorder,
//     this.enabledBorder,
//     this.enabledBorderColor,
//     this.contentPadding,
//     this.controller,
//     this.textInputAction,
//     this.onSubmitted,
//     this.onTap,
//     this.onCompleted,
//     this.onChanged,
//     this.passwordVisibleToggle,
//     this.suffixIcon,
//     this.keyboardType,
//     this.autofillHints,
//     this.autofocus = false,
//     this.cursorWidth,
//     this.cursorHeight,
//     this.isCollapsed = true,
//     this.obscureText = false,
//     this.readOnly = false,
//     this.verificationCode = false,
//     this.defaultPinTheme,
//     this.length = 6,
//     this.showCursor = true,
//     this.filled,
//     this.fillColor,
//     this.focusColor,
//     this.hoverColor,
//     this.label,
//     this.icon,
//     this.helper,
//     this.suffix,
//     this.counter,
//     this.error,
//     this.prefixIcon,
//     this.prefix,
//     this.inputFormatters,
//     this.focusNode,
//     this.constraints,
//     this.prefixIconConstraints,
//     this.maxLines = 1,
//     this.enabled,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final pinTheme = defaultPinTheme ??
//         PinTheme(
//           width: 48.wi,
//           height: 56.hi,
//           textStyle: getFontStyle(
//               fontSize: 24,
//               color: AppColor.f201F1C,
//               fontWeight: FontWeight.w500),
//           decoration: BoxDecoration(
//             border: Border.all(color: AppColor.bg201F1C, width: 1.wi),
//             borderRadius: BorderRadius.circular(28.ri),
//           ),
//         );
//     if (verificationCode) {
//       return Pinput(
//         length: length,
//         autofocus: autofocus,
//         defaultPinTheme: pinTheme,
//         focusedPinTheme: pinTheme.copyDecorationWith(
//           border: Border.all(color: AppColor.bg136DFB),
//           borderRadius: BorderRadius.circular(28.ri),
//         ),
//         submittedPinTheme: pinTheme.copyWith(
//           decoration: pinTheme.decoration?.copyWith(
//             color: AppColor.white,
//           ),
//         ),
//         textInputAction: textInputAction,
//         autofillHints: autofillHints,
//         keyboardType: keyboardType ?? TextInputType.number,
//         // validator: (s) {
//         //   return s == '2222' ? null : 'Pin is incorrect';
//         // },
//         pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//         showCursor: showCursor,
//         cursor: Container(
//           color: AppColor.bg136DFB,
//           width: 2.wi,
//           height: 28.hi,
//         ),
//         onCompleted: onCompleted,
//       );
//     }
//     return TextField(
//       enabled: enabled,
//       onTap: onTap,
//       expands: expands,
//       maxLines: maxLines,
//       controller: controller,
//       cursorColor: AppColor.bg136DFB,
//       cursorWidth: cursorWidth ?? 2.wi,
//       cursorHeight: cursorHeight ?? 32.hi,
//       autofocus: autofocus,
//       onSubmitted: onSubmitted,
//       onChanged: onChanged,
//       obscureText: obscureText,
//       focusNode: focusNode,
//       readOnly: readOnly,
//       style: style ??
//           getFontStyle(
//             fontSize: 14,
//             color: AppColor.f201F1C,
//           ),
//       textInputAction: textInputAction,
//       autofillHints: autofillHints,
//       keyboardType: keyboardType,
//       inputFormatters: inputFormatters,
//       decoration: InputDecoration(
//         filled: filled,
//         fillColor: fillColor,
//         hintText: hintText,
//         focusColor: focusColor ?? AppColor.bg136DFB,
//         hoverColor: hoverColor ?? AppColor.bg136DFB,
//         label: label,
//         icon: icon,
//         helper: helper,
//         suffix: suffix,
//         counter: counter,
//         error: error,
//         prefixIcon: prefixIcon,
//         prefix: prefix,
//
//         // filled: true,
//         // fillColor: AppColor.white,
//         isCollapsed: isCollapsed,
//         border: border ??
//             defaultBorder ??
//             OutlineInputBorder(
//               borderSide: BorderSide(color: AppColor.bg201F1C, width: 2.wi),
//               borderRadius: BorderRadius.circular(28.ri),
//             ),
//         enabledBorder: enabledBorder ??
//             defaultBorder ??
//             OutlineInputBorder(
//               borderSide: BorderSide(
//                   color: enabledBorderColor ?? AppColor.bg201F1C, width: 2.wi),
//               borderRadius: BorderRadius.circular(28.ri),
//             ),
//
//         focusedBorder: focusedBorder ??
//             defaultBorder ??
//             OutlineInputBorder(
//               borderSide: BorderSide(color: AppColor.bg136DFB, width: 2.wi),
//               borderRadius: BorderRadius.circular(28.ri),
//             ),
//         constraints: constraints,
//         prefixIconConstraints: prefixIconConstraints,
//         contentPadding: contentPadding ??
//             EdgeInsets.symmetric(vertical: 20.hi, horizontal: 20.hi),
//         hintStyle: hintStyle ??
//             getFontStyle(
//               fontSize: 14,
//               color: AppColor.fC4BFB9,
//             ),
//         suffixIcon: keyboardType == TextInputType.visiblePassword
//             ? (suffixIcon ??
//             IconButton(
//                 onPressed: passwordVisibleToggle,
//                 icon: ImageWidget(
//                   imageUrl: ResourceUtil.getSvgIcon(
//                       obscureText ? 'password_off' : 'password_on'),
//                   color: AppColor.bgC4BFB9,
//                   width: 24.wi,
//                 )))
//             : suffixIcon,
//       ),
//     );
//   }
// }
