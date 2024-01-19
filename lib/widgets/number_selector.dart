import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberSelector extends StatelessWidget {
  final TextEditingController controller;
  final String lable;

  const NumberSelector({
    super.key,
    required this.controller,
    required this.lable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            lable,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MinusButton(controller: controller),
              SizedBox(
                width: 42,
                // height: 31,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: controller,
                  inputFormatters: [LengthLimitingTextInputFormatter(3)],
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  onTap: () => controller.value = TextEditingValue.empty,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: false,
                    signed: false,
                  ),
                  cursorColor: const Color(0xFFD6D6D6),
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: const InputDecoration(
                    isCollapsed: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 13,
                    ),
                    hintStyle: TextStyle(
                      color: Color(0xFFD6D6D6),
                      fontSize: 14,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                        gapPadding: 0,
                        borderSide:
                            BorderSide(color: Color(0xFFCCCCCC), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide:
                          BorderSide(color: Color(0xFFCCCCCC), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        gapPadding: 0,
                        borderSide:
                            BorderSide(color: Color(0xFFCCCCCC), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  ),
                ),
              ),
              PlusButton(controller: controller)
            ],
          ),
        ],
      ),
    );
  }
}

class PlusButton extends StatelessWidget {
  final TextEditingController controller;

  const PlusButton({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (int.parse(controller.text) < 999) {
          controller.value = TextEditingValue(
              text: (int.parse(controller.text) + 1).toString());
        }
      },
      child: SizedBox(
        width: 52.17,
        height: 31,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 31,
              height: 31,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFCCCCCC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(62),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 16.12,
                    height: 3.72,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(62),
                      ),
                    ),
                  ),
                  Container(
                    width: 3.71,
                    height: 16.12,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(62),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MinusButton extends StatelessWidget {
  final TextEditingController controller;

  const MinusButton({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // only subtract if the value is greater than 0
      onTap: () {
        if (int.parse(controller.text) > 1) {
          controller.value = TextEditingValue(
              text: (int.parse(controller.text) - 1).toString());
        }
      },
      child: SizedBox(
        width: 52.17,
        height: 31,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 31,
              height: 31,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFCCCCCC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(62),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 16.12,
                    height: 3.72,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(62),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
