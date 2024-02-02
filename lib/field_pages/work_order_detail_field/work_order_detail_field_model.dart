import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'work_order_detail_field_widget.dart' show WorkOrderDetailFieldWidget;
import 'package:flutter/material.dart';

class WorkOrderDetailFieldModel
    extends FlutterFlowModel<WorkOrderDetailFieldWidget> {
  ///  Local state fields for this page.

  int eqptID = 13;

  String? visibleData;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  var feSerial = '';
  // Stores action output result for [Backend Call - API (findEqptID)] action in Button widget.
  ApiCallResponse? apiResultEqpt;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
