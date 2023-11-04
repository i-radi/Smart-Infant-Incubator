import 'package:final_project/views/admin_views/admin_screens/baby_information_view_admin.dart';

import '../admin_screens/baby_list_screen_view_admin.dart';
import '/views/admin_views/admin_screens/baby_info_in_admin_screen.dart';
import '/views/admin_views/admin_widgets/details_of_dialog_for_empty_incubator_in_admin.dart';
import '../../../widgets.dart/busy_incubator.dart';
import '../../../style/color.dart';
import '../../../widgets.dart/empty_incubator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarForAdmin extends StatefulWidget {
  const TabBarForAdmin(this.routePage, {Key? key}) : super(key: key);
  final Widget routePage;

  @override
  _TabBarForAdminState createState() => _TabBarForAdminState();
}

class _TabBarForAdminState extends State<TabBarForAdmin>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int activeTabIndex = 1;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 2,
      initialIndex: activeTabIndex,
      vsync: this,
    );
    controller.addListener(() {
      setState(() {
        activeTabIndex = controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 240.w,
            child: Align(
              alignment: Alignment.topCenter,
              child: TabBar(
                indicatorPadding: EdgeInsets.zero,
                controller: controller,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 0.00001,
                labelPadding: const EdgeInsets.all(2),
                tabs: [
                  Tab(
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(15), right: Radius.zero),
                        border: controller.index == 1
                            ? Border.all(color: grey, width: 1)
                            : Border.all(color: grey, width: 1),
                        color: controller.index == 0 ? white : grey,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "busy incubator",
                          textScaleFactor: 1,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(
                            left: Radius.zero, right: Radius.circular(15)),
                        border: controller.index == 1
                            ? Border.all(color: grey, width: 1)
                            : Border.all(color: grey, width: 1),
                        color: controller.index == 1 ? white : grey,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "empty incubator",
                          textScaleFactor: 1,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: <Widget>[
                busyIncubator(context, const BabyInformationViewAdmin(), () {
                  Navigator.of(context)
                      .pushReplacementNamed(BabyListScreenViewAdmin.namedRoute);
                }),
                embtyIncubators(
                    context,
                    const DetailsOfDialogForAddIncubatorInAdmin(),
                    const BabyInfoInAdminScreen(), () {
                  Navigator.of(context)
                      .pushReplacementNamed(BabyListScreenViewAdmin.namedRoute);
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
