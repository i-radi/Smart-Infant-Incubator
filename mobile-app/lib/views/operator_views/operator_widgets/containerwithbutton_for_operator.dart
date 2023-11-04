import 'package:final_project/views/operator_views/operator_screens/baby_information_view_operator.dart';
import 'package:final_project/views/operator_views/operator_screens/baby_list_screen_view_operator.dart';

import '/views/operator_views/operator_screens/baby_info_in_operator_screen.dart';
import '/views/operator_views/operator_widgets/details_of_dialog_for_add_incubator_in_operator.dart';
import '../../../widgets.dart/busy_incubator.dart';
import '../../../style/color.dart';
import '../../../widgets.dart/empty_incubator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarForOperator extends StatefulWidget {
  const TabBarForOperator(this.routePage, {Key? key}) : super(key: key);
  final Widget routePage;

  @override
  _TabBarForOperatorState createState() => _TabBarForOperatorState();
}

class _TabBarForOperatorState extends State<TabBarForOperator>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int activeTabIndex = 1;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 2,
      initialIndex: 0,
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
            width: 250.w,
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
                busyIncubator(context, const BabyInformationViewOperator(), () {
                  Navigator.of(context).pushReplacementNamed(
                      BabyListScreenViewOperator.namedRoute);
                }),
                embtyIncubators(
                    context,
                    const DetailsOfDialogForAddIncubatorInOperator(),
                    const BabyInfoInOperatorScreen(), () {
                  Navigator.of(context).pushReplacementNamed(
                      BabyListScreenViewOperator.namedRoute);
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
