import 'package:flutter/material.dart';
import 'package:master_key_system/widgets/appbar.dart';
import 'package:master_key_system/widgets/bottom_navigation.dart';
import 'package:master_key_system/widgets/project_card.dart';
import 'package:master_key_system/widgets/search_bar.dart';

class MyProjectPage extends StatelessWidget {
  late List<Map<String, dynamic>> projects;
  late List<Widget> listViewWidgets;

  MyProjectPage({super.key}) {
    listViewWidgets = getListViewWidgets();
  }

  List<Map<String, dynamic>> getProjects() {
    print('Calling database service');
    // await DatabaseService().getProjects().then((value) => return value);

    return [
      {
        'projectName': 'Project 1',
        'projectClient': 'Client 1',
        'systemType': 'PMS',
        'systemStatus': 'Added locks',
        'systemStatusPercentage': 50,
      },
      {
        'projectName': 'Project 2',
        'projectClient': 'Client 2',
        'systemType': 'PMS',
        'systemStatus': 'Shared with collaborators',
        'systemStatusPercentage': 100,
      },
      {
        'projectName': 'Project 3',
        'projectClient': 'Client 3',
        'systemType': 'WSM',
        'systemStatus': 'Added locks',
        'systemStatusPercentage': 50,
      },
      {
        'projectName': 'Project 4',
        'projectClient': 'Client 4',
        'systemType': 'PMS',
        'systemStatus': 'Shared with collaborators',
        'systemStatusPercentage': 100,
      },
      {
        'projectName': 'Project 5',
        'projectClient': 'Client 5',
        'systemType': 'PMS',
        'systemStatus': 'Added locks',
        'systemStatusPercentage': 50,
      },
      {
        'projectName': 'Project 6',
        'projectClient': 'Client 6',
        'systemType': 'WSM',
        'systemStatus': 'Shared with collaborators',
        'systemStatusPercentage': 100,
      },
      {
        'projectName': 'Project 7',
        'projectClient': 'Client 7',
        'systemType': 'PMS',
        'systemStatus': 'Added locks',
        'systemStatusPercentage': 50,
      },
      {
        'projectName': 'Project 8',
        'projectClient': 'Client 8',
        'systemType': 'PMS',
        'systemStatus': 'Shared with collaborators',
        'systemStatusPercentage': 100,
      },
      {
        'projectName': 'Project 9',
        'projectClient': 'Client 9',
        'systemType': 'WSM',
        'systemStatus': 'Added locks',
        'systemStatusPercentage': 50,
      },
      {
        'projectName': 'Project 10',
        'projectClient': 'Client 10',
        'systemType': 'PMS',
        'systemStatus': 'Shared with collaborators',
        'systemStatusPercentage': 100,
      }
    ];
  }

  List<Widget> getListViewWidgets() {
    projects = getProjects();

    List<Widget> listViewWidgets = [];
    listViewWidgets.add(const SearchInput());
    for (var project in projects) {
      listViewWidgets.add(ProjectCard(projectInfo: project));
    }
    listViewWidgets.add(const SizedBox(
      height: 50,
    ));
    return listViewWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: listViewWidgets.length,
            itemBuilder: (context, index) => listViewWidgets.elementAt(index),
          )),
      bottomNavigationBar: const CustomBottomNavigatonBar(),
    );
  }
}
