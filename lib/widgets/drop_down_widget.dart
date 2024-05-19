import 'package:flutter/material.dart';

class DropDownItem<T> extends StatefulWidget {
  DropDownItem(
      {super.key,
      required this.options,
      required this.onChanged,
      this.inistialValue,
      this.title,
      this.validator,
      this.radius,
      this.hint,
      this.color,
      this.hintColor,
      this.itemAsString});
  List<T> options;
  final T? inistialValue;
  final String Function(T)? itemAsString;
  final String? hint;
  final String? Function(T?)? validator;
  final String? title;
  final double? radius;
  final Color? hintColor;
  final Color? color;
  Function(T) onChanged;

  @override
  State<DropDownItem<T>> createState() => _DropDownItemState<T>();
}

class _DropDownItemState<T> extends State<DropDownItem<T>> {
  TextEditingController controller = TextEditingController();
  double width = 0.0;

  @override
  void initState() {
    controller = TextEditingController(text: widget.inistialValue?.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title?.isNotEmpty ?? false)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                widget.title ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xffA1A7AD),
                ),
              ),
            ),
          Container(
            height: 60,
            color: widget.color ?? Colors.white,
            child: DropdownButtonFormField<T>(
                itemHeight: 50,
                validator: widget.validator,
                hint: Text(
                  widget.hint ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    color: widget.hintColor ?? Colors.grey,
                  ),
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: const BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        widget.radius ?? 10,
                      ),
                      borderSide: const BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        widget.radius ?? 10,
                      ),
                      borderSide: BorderSide(color: Colors.grey.shade200)),
                ),
                value: widget.inistialValue,
                items: widget.options
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            widget.itemAsString?.call(e) ?? e.toString(),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (s) {
                  if (s != null) {
                    widget.onChanged.call(s);
                  }
                }),
          )
        ],
      ),
    );
  }
}
