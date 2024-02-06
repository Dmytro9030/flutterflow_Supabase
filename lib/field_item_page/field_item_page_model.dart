import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'field_item_page_widget.dart' show FieldItemPageWidget;
import 'package:flutter/material.dart';

class FieldItemPageModel extends FlutterFlowModel<FieldItemPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.

  Map<ItemCatalogRow, bool> checkboxValueMap = {};
  List<ItemCatalogRow> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

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
