import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_key_system/controllers/project_info_controller.dart';
import 'package:master_key_system/widgets/appbar.dart';
import 'package:master_key_system/widgets/project_progress_bar.dart';

class BuildProjectPage extends StatelessWidget {
  const BuildProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BuildProjectController>(
        init: BuildProjectController(),
        builder: (controller) {
          return Scaffold(
              appBar: const CustomAppBar(),
              body: PageView.builder(
                scrollBehavior: const ScrollBehavior()
                    .copyWith(overscroll: false, scrollbars: false),
                controller: controller.pageController,
                itemBuilder: (context, index) =>
                    controller.buildProjectPages[index],
                itemCount: controller.buildProjectPages.length,
              ),
              bottomNavigationBar: const BottomProgressBar());
        });
  }
}
