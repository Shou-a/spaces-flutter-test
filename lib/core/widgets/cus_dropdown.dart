import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomDropdown extends StatefulWidget {
  final String title;
  final List<String> options;
  final ValueChanged<String> onOptionSelected;
  final void Function()? onTap;
  final String? errorText;

  const CustomDropdown({
    super.key,
    required this.title,
    required this.options,
    required this.onOptionSelected,
    this.onTap,
    this.errorText,
  });

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  bool isExpanded = false;
  String? selectedOption;
  OverlayEntry? _overlayEntry;

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        width: size.width,
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              if (isExpanded) {
                setState(() {
                  isExpanded = false;
                });
                _overlayEntry?.remove();
                _overlayEntry = null;
              }
            },
            child: Container(
              color: Colors.white,
              constraints: const BoxConstraints(
                maxHeight: 250,
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: widget.options.map((option) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = option;
                        isExpanded = false;
                      });
                      widget.onOptionSelected(option);
                      _overlayEntry?.remove();
                      _overlayEntry = null;
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 5),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: AppColors.stroke),
                      ),
                      child: Text(
                        option,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  );
                }).toList()
                  ..add(
                    widget.onTap != null
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpanded = false;
                              });
                              widget.onTap?.call();
                              _overlayEntry?.remove();
                              _overlayEntry = null;
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 5),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: AppColors.stroke),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 20.0),
                              child: const Center(
                                child: Text(
                                  "Add New",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            child: Container(),
                          ),
                  ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggleDropdown() {
    if (isExpanded) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    }

    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _toggleDropdown,
          child: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: widget.errorText == null
                    ? AppColors.stroke
                    : const Color.fromARGB(255, 177, 43, 33),
              ),
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedOption ?? widget.title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.bodyText,
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: AppColors.bodyText,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
        if (widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 5.0),
            child: Text(
              widget.errorText!,
              style: const TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 177, 43, 33),
              ),
            ),
          ),
      ],
    );
  }
}
