import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'work_order_detail_shop_widget.dart' show WorkOrderDetailShopWidget;
import 'package:flutter/material.dart';

class WorkOrderDetailShopModel
    extends FlutterFlowModel<WorkOrderDetailShopWidget> {
  ///  Local state fields for this page.

  int eqptID = 13;

  String? visibleData;

  DateTime? startTime;

  DateTime? endTime;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for UserDD widget.
  String? userDDValue;
  FormFieldController<String>? userDDValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for wonotes widget.
  FocusNode? wonotesFocusNode;
  TextEditingController? wonotesController;
  String? Function(BuildContext, String?)? wonotesControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for showSwitch1 widget.
  bool? showSwitch1Value;
  var feSerial = '';
  // Stores action output result for [Backend Call - API (findEqptID)] action in Button widget.
  ApiCallResponse? apiResultEqpt;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    wonotesFocusNode?.dispose();
    wonotesController?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
