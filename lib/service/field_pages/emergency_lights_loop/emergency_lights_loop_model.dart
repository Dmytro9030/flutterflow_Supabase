import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'emergency_lights_loop_widget.dart' show EmergencyLightsLoopWidget;
import 'package:flutter/material.dart';

class EmergencyLightsLoopModel
    extends FlutterFlowModel<EmergencyLightsLoopWidget> {
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
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

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
