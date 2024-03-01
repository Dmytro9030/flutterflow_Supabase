import '/flutter_flow/flutter_flow_util.dart';
import 'work_order_list_shop_widget.dart' show WorkOrderListShopWidget;
import 'package:flutter/material.dart';

class WorkOrderListShopModel extends FlutterFlowModel<WorkOrderListShopWidget> {
  ///  Local state fields for this page.

  int currentUser = -1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
