import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInputField extends StatelessWidget {
  final String lable;
  final String placeholder;
  final TextEditingController controller;
  final FocusNode focusNode;

  const DateInputField(
      {super.key,
      required this.lable,
      required this.placeholder,
      required this.controller,
      required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Order Date',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 2,
                color: Color(0xFFCCCCCC),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  focusNode: focusNode,
                  // key: controller.projectOrderDateGlobalKey,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  controller: controller,
                  decoration: const InputDecoration(
                      isCollapsed: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 10, bottom: 10)),
                  onTap: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext buildContext) {
                          return Container(
                            color: CupertinoColors.systemBackground
                                .resolveFrom(context),
                            height: 250,
                            padding: const EdgeInsets.only(top: 6),
                            margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: SafeArea(
                              top: false,
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                initialDateTime: DateTime.now(),
                                onDateTimeChanged: (DateTime pickedDate) {
                                  print(pickedDate);
                                  String formattedDate =
                                      DateFormat('dd.MM.yyyy')
                                          .format(pickedDate);
                                  print(formattedDate);
                                  controller.text = formattedDate;
                                },
                              ),
                            ),
                          );
                        });
                  },
                  readOnly: true,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                      child: Image.asset(
                        'assets/calender_input-icon.png',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
