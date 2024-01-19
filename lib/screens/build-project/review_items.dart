import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_key_system/controllers/project_info_controller.dart';
import 'package:master_key_system/widgets/primary_button.dart';

class ReviewItems extends StatelessWidget {
  const ReviewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: GetBuilder(
          init: BuildProjectController(),
          builder: (controller) {
            return ListView(
              children: [
                ReviewItemsCard(
                    itemLable: 'LOCKS',
                    items: controller.lockItems,
                    addItem: () {
                      print('add lock');
                    }),
                ReviewItemsCard(
                    itemLable: 'KEYS',
                    items: controller.keyItems,
                    addItem: () {
                      print('add key');
                    }),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, bottom: 15, top: 15),
                  child: PrimaryButton(
                    lable: 'START ADDING LOCKS',
                    onPressed: () => controller.goToNextPage(),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class ReviewItemsCard extends StatelessWidget {
  final String itemLable;
  final List<Widget> items;
  final Function addItem;

  const ReviewItemsCard(
      {super.key,
      required this.itemLable,
      required this.items,
      required this.addItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFE8E8E8)),
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 6,
            offset: Offset(0, 3),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x16000000),
            blurRadius: 11,
            offset: Offset(0, 11),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 15,
            offset: Offset(0, 25),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x02000000),
            blurRadius: 18,
            offset: Offset(0, 45),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x00000000),
            blurRadius: 20,
            offset: Offset(0, 70),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemLable,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () => addItem(),
                  child: Container(
                    width: 25,
                    height: 25,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: Image.asset('assets/add_item-icon.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items,
            ),
          ),
        ],
      ),
    );
  }
}
