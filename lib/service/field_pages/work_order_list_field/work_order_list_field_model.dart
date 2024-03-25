import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'work_order_list_field_widget.dart' show WorkOrderListFieldWidget;
import 'package:flutter/material.dart';

class WorkOrderListFieldModel
    extends FlutterFlowModel<WorkOrderListFieldWidget> {
  ///  Local state fields for this page.

  int currentUser = -1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (findUserID)] action in DropDown widget.
  ApiCallResponse? apiResultmox;
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
