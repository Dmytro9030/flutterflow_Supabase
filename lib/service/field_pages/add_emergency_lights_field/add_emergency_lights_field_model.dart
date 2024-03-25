import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_emergency_lights_field_widget.dart'
    show AddEmergencyLightsFieldWidget;
import 'package:flutter/material.dart';

class AddEmergencyLightsFieldModel
    extends FlutterFlowModel<AddEmergencyLightsFieldWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for typeDD widget.
  String? typeDDValue;
  FormFieldController<String>? typeDDValueController;
  // State field(s) for batteryDD widget.
  String? batteryDDValue;
  FormFieldController<String>? batteryDDValueController;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  EquipmentRow? newEqpt;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
