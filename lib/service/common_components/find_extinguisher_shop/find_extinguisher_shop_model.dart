import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'find_extinguisher_shop_widget.dart' show FindExtinguisherShopWidget;
import 'package:flutter/material.dart';

class FindExtinguisherShopModel
    extends FlutterFlowModel<FindExtinguisherShopWidget> {
  ///  Local state fields for this component.

  String? visibleString;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<EqptWoLisRow>? dataSetResult;

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
