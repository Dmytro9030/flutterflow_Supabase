import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'work_order_detail_field_widget.dart' show WorkOrderDetailFieldWidget;
import 'package:flutter/material.dart';

class WorkOrderDetailFieldModel
    extends FlutterFlowModel<WorkOrderDetailFieldWidget> {
  ///  Local state fields for this page.

  int eqptID = 13;

  String? visibleData;

  DateTime? startTime;

  DateTime? endTime;

  String? visibleEqpt;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for contactTF widget.
  FocusNode? contactTFFocusNode;
  TextEditingController? contactTFController;
  String? Function(BuildContext, String?)? contactTFControllerValidator;
  // State field(s) for phoneTF widget.
  FocusNode? phoneTFFocusNode;
  TextEditingController? phoneTFController;
  String? Function(BuildContext, String?)? phoneTFControllerValidator;
  // State field(s) for emailTF widget.
  FocusNode? emailTFFocusNode;
  TextEditingController? emailTFController;
  String? Function(BuildContext, String?)? emailTFControllerValidator;
  // State field(s) for addressTF widget.
  FocusNode? addressTFFocusNode;
  TextEditingController? addressTFController;
  String? Function(BuildContext, String?)? addressTFControllerValidator;
  // State field(s) for UserDD widget.
  String? userDDValue;
  FormFieldController<String>? userDDValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for wonotes widget.
  FocusNode? wonotesFocusNode;
  TextEditingController? wonotesController;
  String? Function(BuildContext, String?)? wonotesControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for showSwitch1 widget.
  bool? showSwitch1Value;
  var feSerial = '';
  // Stores action output result for [Backend Call - API (findEqptID)] action in Button widget.
  ApiCallResponse? apiResultEqpt;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for showSwitch2 widget.
  bool? showSwitch2Value;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

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

    contactTFFocusNode?.dispose();
    contactTFController?.dispose();

    phoneTFFocusNode?.dispose();
    phoneTFController?.dispose();

    emailTFFocusNode?.dispose();
    emailTFController?.dispose();

    addressTFFocusNode?.dispose();
    addressTFController?.dispose();

    wonotesFocusNode?.dispose();
    wonotesController?.dispose();

    textFieldFocusNode3?.dispose();
    textController8?.dispose();

    textFieldFocusNode4?.dispose();
    textController9?.dispose();

    textFieldFocusNode5?.dispose();
    textController10?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
