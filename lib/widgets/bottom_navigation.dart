import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_key_system/controllers/appbar_controller.dart';

class CustomBottomNavigatonBar extends StatelessWidget {
  const CustomBottomNavigatonBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 1,
            offset: Offset(0, -1),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x16000000),
            blurRadius: 2,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 3,
            offset: Offset(0, -5),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x02000000),
            blurRadius: 4,
            offset: Offset(0, -9),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x00000000),
            blurRadius: 4,
            offset: Offset(0, -14),
            spreadRadius: 0,
          )
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: const Color(0xFFE8E8E8),
        elevation: 8,
        onTap: (index) {
          if (index == 1) {
            showBottomSheet(context);
          }
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              'assets/folder-icon.png',
              width: 50,
              height: 50,
            ),
          ),
          BottomNavigationBarItem(
              label: '',
              icon: InkWell(
                splashColor: Colors.blue[800],
                child: Image.asset(
                  'assets/addproject-icon.png',
                  width: 70,
                  height: 70,
                ),
              )),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              'assets/settings-icon.png',
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: const Duration(milliseconds: 400),
      ),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.0),
          topRight: Radius.circular(28.0),
        ),
      ),
      context: context,
      builder: (context) {
        return const BottomSheet();
      },
    );
  }
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(height: 20),
        const Text(
          'PROJECT WIZARD',
          style: TextStyle(
            color: Colors.black,
            fontSize: 36,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(top: 15, bottom: 25, left: 15, right: 15),
          padding: const EdgeInsets.all(15),
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
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'QUICK START',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Get your project off the ground with the first steps.',
                  style: TextStyle(
                    color: Color(0xFF5F5F5F),
                    fontSize: 16,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            // AppbarController appbarController = AppbarController();
            // Get.put(appbarController);
            // appbarController.setAppbarForBuildProject();
            Get.find<AppbarController>().setAppbarForBuildProject();
            Get.toNamed('/build-project');
          },
          child: Container(
            margin:
                const EdgeInsets.only(top: 0, bottom: 25, left: 15, right: 15),
            padding: const EdgeInsets.all(15),
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
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CUSTOME PROJECT',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Craft a customized project to fit your needs precisely.',
                    style: TextStyle(
                      color: Color(0xFF5F5F5F),
                      fontSize: 16,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
