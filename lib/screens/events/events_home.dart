
import 'package:event_planner/screens/events/events.dart';
import 'package:event_planner/screens/events/remainders.dart';
import 'package:event_planner/screens/events/shedules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/dashboard_provider.dart';
import '../../utils/constants.dart';
import '../scheduler/scheduler.dart';

class ComplaintsAppDashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title:
          //Text("Events")
          dashboardProvider.currentTab == 0
              ? Text("Events")
              :
           dashboardProvider.currentTab == 1
              ? Text("Schedules")
              :
    Text("Remainders")),

        body: NotificationListener(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: dashboardProvider.currentTab == 0
              ? events()
          :
          dashboardProvider.currentTab == 1
              ? SchedulerHome()
              : remainders(),
        ),
        bottomNavigationBar: bottomNavigationBar(dashboardProvider));
  }

  BottomNavigationBar bottomNavigationBar(DashboardProvider dashboardProvider) {
    return BottomNavigationBar(
      currentIndex: dashboardProvider.currentTab,
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/dashboardComplaintsTabUnselected.svg'),
            label: "Events",
            activeIcon: SvgPicture.asset('assets/images/dashboardComplaintsTabSelected.svg',color: Colors.black,)),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/dashboardComplaintsFeedbackUnselected.svg'),
            label: "Schedules",
            activeIcon: SvgPicture.asset('assets/images/dashboardComplaintsFeedbackSelected.svg',color: Colors.black,)),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/dashboardComplaintsReportsSelected.svg'),
            label: "Remainders",
            activeIcon: SvgPicture.asset('assets/images/dashboardComplaintsReportsUnselected.svg',color: Colors.black)),
      ],
      selectedItemColor: Colors.black,
      elevation: 12,
      //type: BottomNavigationBarType.shifting,
      onTap: (index) {
        dashboardProvider.currentTab = index;
      },
    );
  }
}
