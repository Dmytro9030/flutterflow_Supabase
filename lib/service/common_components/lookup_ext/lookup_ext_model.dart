import '/flutter_flow/flutter_flow_util.dart';
import 'lookup_ext_widget.dart' show LookupExtWidget;
import 'package:flutter/material.dart';

class LookupExtModel extends FlutterFlowModel<LookupExtWidget> {
  ///  Local state fields for this component.

  String? serial;

  ///  State fields for stateful widgets in this component.

  // State field(s) for serial widget.
  FocusNode? serialFocusNode;
  TextEditingController? serialController;
  String? Function(BuildContext, String?)? serialControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    serialFocusNode?.dispose();
    serialController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
