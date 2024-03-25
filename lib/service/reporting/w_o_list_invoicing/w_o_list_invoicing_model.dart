import '/flutter_flow/flutter_flow_util.dart';
import 'w_o_list_invoicing_widget.dart' show WOListInvoicingWidget;
import 'package:flutter/material.dart';

class WOListInvoicingModel extends FlutterFlowModel<WOListInvoicingWidget> {
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
