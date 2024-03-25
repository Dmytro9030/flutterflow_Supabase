import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_equipment_widget.dart' show NewEquipmentWidget;
import 'package:flutter/material.dart';

class NewEquipmentModel extends FlutterFlowModel<NewEquipmentWidget> {
  ///  Local state fields for this component.

  int? extinguisherCatalogId;

  int? serial;

  ///  State fields for stateful widgets in this component.

  // State field(s) for EqptTypeDD widget.
  String? eqptTypeDDValue;
  FormFieldController<String>? eqptTypeDDValueController;
  // State field(s) for TFBrand widget.
  FocusNode? tFBrandFocusNode;
  TextEditingController? tFBrandController;
  String? Function(BuildContext, String?)? tFBrandControllerValidator;
  // State field(s) for TFSize widget.
  FocusNode? tFSizeFocusNode;
  TextEditingController? tFSizeController;
  String? Function(BuildContext, String?)? tFSizeControllerValidator;
  // State field(s) for mfgYr widget.
  FocusNode? mfgYrFocusNode;
  TextEditingController? mfgYrController;
  String? Function(BuildContext, String?)? mfgYrControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for EMG1 widget.
  String? emg1Value;
  FormFieldController<String>? emg1ValueController;
  // State field(s) for EMG2 widget.
  String? emg2Value;
  FormFieldController<String>? emg2ValueController;
  // State field(s) for TFLocation widget.
  FocusNode? tFLocationFocusNode;
  TextEditingController? tFLocationController;
  String? Function(BuildContext, String?)? tFLocationControllerValidator;
  // State field(s) for TFSerial widget.
  FocusNode? tFSerialFocusNode;
  TextEditingController? tFSerialController;
  String? Function(BuildContext, String?)? tFSerialControllerValidator;
  DateTime? datePicked;
  // State field(s) for nextDue1DD widget.
  String? nextDue1DDValue;
  FormFieldController<String>? nextDue1DDValueController;
  // State field(s) for nextDue2 widget.
  String? nextDue2Value;
  FormFieldController<String>? nextDue2ValueController;
  // State field(s) for nextDue2DD widget.
  String? nextDue2DDValue;
  FormFieldController<String>? nextDue2DDValueController;
  // State field(s) for nextDue3 widget.
  String? nextDue3Value;
  FormFieldController<String>? nextDue3ValueController;
  // State field(s) for nextDue3DD widget.
  String? nextDue3DDValue;
  FormFieldController<String>? nextDue3DDValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  EquipmentRow? newEqpt;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tFBrandFocusNode?.dispose();
    tFBrandController?.dispose();

    tFSizeFocusNode?.dispose();
    tFSizeController?.dispose();

    mfgYrFocusNode?.dispose();
    mfgYrController?.dispose();

    textFieldFocusNode1?.dispose();
    textController4?.dispose();

    textFieldFocusNode2?.dispose();
    textController5?.dispose();

    tFLocationFocusNode?.dispose();
    tFLocationController?.dispose();

    tFSerialFocusNode?.dispose();
    tFSerialController?.dispose();

    textFieldFocusNode3?.dispose();
    textController8?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
