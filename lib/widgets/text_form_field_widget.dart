// import 'package:flutter/material.dart';

// class TextFormFieldWidget extends StatefulWidget {
//   final String? hintText, label, errorText;
//   final TextInputType type;
//   bool password;
//   final bool expanded;
//   Color activeBorderColor, borderColor, backgroundColor, hintColor;
//   bool floatingHint;
//   int? maxLines;
//   int? minLines;
//   double? hight;
//   void Function()? onTap;
//   FocusNode? focusNode;
//   TextAlign textalign;
//   int? maxLengh;
//   TextDirection? textdirection;
//   EdgeInsetsDirectional? contentPadding;
//   double borderRadius;
//   double? hintSize;
//   Widget? prefixIcon, suffixIcon, suffixWidget, prefixWidget;
//   TextEditingController? controller;
//   InputDecoration? inputDecoration;
//   ValueChanged<String>? onChanged;
//   ValueChanged<String?>? onSaved;
//   String? Function(String?)? validator;
//   bool? isOutline;
//   bool? enable;
//   bool? readOnly;

//   TextFormFieldWidget(
//       {this.onChanged,
//       this.onSaved,
//       this.isOutline,
//       this.readOnly,
//       this.hintSize,
//       this.enable,
//       this.validator,
//       this.onTap,
//       this.prefixWidget,
//       this.password = false,
//       this.expanded = false,
//       this.floatingHint = false,
//       this.type = TextInputType.text,
//       this.hintText = "",
//       this.label,
//       this.textalign = TextAlign.start,
//       this.maxLengh,
//       this.errorText,
//       this.controller,
//       this.activeBorderColor = const Color(0xff8CAAC5),
//       this.borderRadius = 12,
//       this.borderColor = Colors.black,
//       this.backgroundColor = const Color(0x90F3F4F7),
//       this.hintColor = Colors.white54,
//       this.maxLines,
//       this.minLines = 1,
//       this.hight = 70,
//       this.prefixIcon,
//       this.suffixIcon,
//       this.suffixWidget,
//       this.inputDecoration,
//       this.contentPadding,
//       this.textdirection,
//       Key? key})
//       : super(key: key);

//   @override
//   State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
// }

// class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
//   bool? isPass;

//   @override
//   void initState() {
//     isPass = widget.password ? true : false;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: widget.hight,
//       child: TextFormField(
//         readOnly: widget.readOnly ?? false,
//         enabled: widget.enable ?? true,
//         validator: widget.validator,

//         maxLength: widget.maxLengh,
//         focusNode: widget.focusNode,

//         controller: widget.controller,
//         maxLines: widget.maxLines ?? 1,

//         minLines: widget.minLines,
//         // autofocus: false,
//         // expands: widget.expanded,
//         textAlign: widget.textalign,
//         textDirection: widget.textdirection,
//         style: const TextStyle(
//             color: Color(0xff1B2B48),
//             fontSize: 16,
//             fontWeight: FontWeight.w300),
//         decoration: widget.inputDecoration ??
//             InputDecoration(
//                 // isDense: true,
//                 contentPadding: widget.contentPadding,
//                 filled: true,
//                 fillColor: widget.backgroundColor,
//                 prefixIcon: widget.prefixIcon,
//                 prefix: widget.prefixWidget,
//                 helperText: "",
//                 helperMaxLines: 1,
//                 suffix: widget.suffixWidget,
//                 suffixIcon: widget.suffixIcon ??
//                     (isPass!
//                         ? IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 widget.password = !widget.password;
//                               });
//                             },
//                             icon: Icon(
//                               widget.password
//                                   ? Icons.remove_red_eye_outlined
//                                   : Icons.visibility_off,
//                               color: const Color(0xff8CAAC5),
//                             ),
//                           )
//                         : widget.suffixIcon),
//                 errorText: widget.errorText,
//                 labelText: widget.label,
//                 //label: TextWidget(widget.label),
//                 border: borderType(isOutline: widget.isOutline),
//                 focusedBorder: borderType(isOutline: widget.isOutline),
//                 enabledBorder: borderType(isOutline: widget.isOutline),
//                 errorBorder: borderType(isOutline: widget.isOutline),
//                 // focusedErrorBorder:  borderType(isOutline: true),

//                 labelStyle: const TextStyle(
//                   color: Colors.black,
//                   // fontFamily: Utils.lang == 'ar' ? "Almarai" : 'graphik',
//                   fontFamily: "Mulish",
//                 ),
//                 hintStyle: TextStyle(
//                   color: Colors.black.withOpacity(0.5),
//                   fontSize: widget.hintSize ?? 14,
//                   fontWeight: FontWeight.w400,
//                   // fontFamily: Utils.lang == 'ar' ? "Almarai" : 'graphik',
//                   fontFamily: "Mulish",
//                 ),
//                 hintText: widget.hintText),
//         keyboardType: widget.type,
//         obscureText: widget.password,
//         onChanged: widget.onChanged,
//         onSaved: widget.onSaved,
//         onTap: () {
//           widget.onTap?.call();
//         },
//       ),
//     );
//   }

//   InputBorder borderType({bool? isOutline}) {
//     return (isOutline ?? true)
//         ? OutlineInputBorder(
//             borderSide: BorderSide(color: widget.activeBorderColor, width: 1),
//             // gapPadding: 10,
//             borderRadius: BorderRadius.all(
//               Radius.circular(widget.borderRadius),
//             ),
//           )
//         : UnderlineInputBorder(
//             borderSide: BorderSide(color: widget.activeBorderColor, width: 1),

//             // borderRadius: BorderRadius.all(
//             //   Radius.circular(widget.borderRadius),
//             // ),
//           );
//   }
// }
