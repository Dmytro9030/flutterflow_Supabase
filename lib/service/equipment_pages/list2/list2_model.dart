import '/flutter_flow/flutter_flow_util.dart';
import 'list2_widget.dart' show List2Widget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class List2Model extends FlutterFlowModel<List2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
