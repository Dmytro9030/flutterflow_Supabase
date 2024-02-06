import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'extinguisher_detail_widget.dart' show ExtinguisherDetailWidget;
import 'package:flutter/material.dart';

class ExtinguisherDetailModel
    extends FlutterFlowModel<ExtinguisherDetailWidget> {
  ///  Local state fields for this component.

  List<String> deficiencyList = [];
  void addToDeficiencyList(String item) => deficiencyList.add(item);
  void removeFromDeficiencyList(String item) => deficiencyList.remove(item);
  void removeAtIndexFromDeficiencyList(int index) =>
      deficiencyList.removeAt(index);
  void insertAtIndexInDeficiencyList(int index, String item) =>
      deficiencyList.insert(index, item);
  void updateDeficiencyListAtIndex(int index, Function(String) updateFn) =>
      deficiencyList[index] = updateFn(deficiencyList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue3;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue4;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue5;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue6;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue7;
  // Stores action output result for [Backend Call - API (findWorkOrderID)] action in Button widget.
  ApiCallResponse? apiWorkOrderID;
  // Stores action output result for [Backend Call - Update Row] action in Button widget.
  List<EqptWoLisRow>? matchedWoLis;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
