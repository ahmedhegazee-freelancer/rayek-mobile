import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownWidget extends StatefulWidget {
  final dynamic size;
  final bool withOutArrow;
  final bool border;
  final String title;
  final bool isLanguage;
  final dynamic icon;

  const DropDownWidget({
    required this.size,
    required this.withOutArrow,
    required this.border,
    required this.title,
    required this.isLanguage,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String dropdownValue = 'Hindi';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: widget.size.width,
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: widget.border ? Border.all(color: const Color(0xffD8D8D8)) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            CountryFlag.fromCountryCode(
              dropdownValue == 'Hindi' ? 'in' : 'sa',
              height: 25.h,
              width: 25.w,
              borderRadius: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style: const TextStyle(color: Color(0xff0D1B1E), fontSize: 16),
              ),
            )
          ]),
          !widget.withOutArrow
              ? DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Color(0XFF999999),
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Hindi', 'Arabic']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
              : const SizedBox()
        ],
      ),
    );
  }
}