import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_key_system/controllers/appbar_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppbarController>(
        init: AppbarController(),
        builder: (controller) {
          return AppBar(
            leading: Theme(
                data: ThemeData(
                    colorScheme: ColorScheme.light(
                        primary: Colors.white,
                        secondary: Colors.white,
                        surface: Colors.white,
                        background: Colors.white),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: controller.leadingIcon.value,
                )),
            actions: [
              Theme(
                  data: ThemeData(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: controller.tailIcon.value,
                  ))
            ],
            shadowColor: Colors.black,
            elevation: 4,
            backgroundColor: Colors.white,
            title: Text(
              controller.title.value,
              style: const TextStyle(
                  fontSize: 36,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
          );
        });
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
