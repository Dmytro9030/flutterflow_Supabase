import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'equipment_detail_widget.dart' show EquipmentDetailWidget;
import 'package:flutter/material.dart';

class EquipmentDetailModel extends FlutterFlowModel<EquipmentDetailWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for descriptionTF widget.
  FocusNode? descriptionTFFocusNode;
  TextEditingController? descriptionTFController;
  String? Function(BuildContext, String?)? descriptionTFControllerValidator;
  // State field(s) for serialTF widget.
  FocusNode? serialTFFocusNode;
  TextEditingController? serialTFController;
  String? Function(BuildContext, String?)? serialTFControllerValidator;
  DateTime? datePicked;
  // State field(s) for nextDue2 widget.
  String? nextDue2Value;
  FormFieldController<String>? nextDue2ValueController;
  // State field(s) for nextDue3 widget.
  String? nextDue3Value;
  FormFieldController<String>? nextDue3ValueController;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for replaceSwitch widget.
  bool? replaceSwitchValue;
  // State field(s) for replaceTF widget.
  FocusNode? replaceTFFocusNode;
  TextEditingController? replaceTFController;
  String? Function(BuildContext, String?)? replaceTFControllerValidator;
  // State field(s) for passSwitch widget.
  bool? passSwitchValue;
  // State field(s) for noteTF widget.
  FocusNode? noteTFFocusNode;
  TextEditingController? noteTFController;
  String? Function(BuildContext, String?)? noteTFControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descriptionTFFocusNode?.dispose();
    descriptionTFController?.dispose();

    serialTFFocusNode?.dispose();
    serialTFController?.dispose();

    replaceTFFocusNode?.dispose();
    replaceTFController?.dispose();

    noteTFFocusNode?.dispose();
    noteTFController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
