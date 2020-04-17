import 'package:flutter/material.dart';
import 'package:paas/providers/business/business_bar.dart';
import 'package:paas/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:paas/api/business.dart';
import 'package:paas/widgets/grid_business.dart';
import 'package:paas/widgets/detail_business.dart';
import 'package:paas/model/business.dart';

class BBsuinessNavigatorWidget extends StatefulWidget {
  /* final int businessCount;

  const BBsuinessNavigatorWidget({Key key, this.businessCount}): super(key: key);
 */
  @override
  _BBsuinessNavigatorWidgetState createState() => _BBsuinessNavigatorWidgetState();
}

class _BBsuinessNavigatorWidgetState extends State<BBsuinessNavigatorWidget> {
  final _businessAPI = BusinessAPI();
  List<BusinessModel> dataBusiness = List<BusinessModel>();

  _loadBusiness() async {
    //call request
    final res = await _businessAPI.getBusinessList(context);

    if (res != null) {
      print("OK");
      setState(() {
        dataBusiness = res;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    if (dataBusiness.length == 0){
      _loadBusiness();
    }

    final businessInfo = Provider.of<BBusinessBar>(context);

    switch (businessInfo.indexPage) {
      case NAVIGATOR_BUSINESS_MAIN.PAGE_MAIN_LIST_BUSINESS:
        return GridBusinessWidget(dataBusiness, SECTION.BUSINESS);
      case NAVIGATOR_BUSINESS_MAIN.PAGE_DETAIL_BUSINESS:
        return DetailBusinessWidget();
    }
  }
}
