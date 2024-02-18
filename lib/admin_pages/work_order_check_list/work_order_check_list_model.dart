import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'work_order_check_list_widget.dart' show WorkOrderCheckListWidget;
import 'package:flutter/material.dart';

class WorkOrderCheckListModel
    extends FlutterFlowModel<WorkOrderCheckListWidget> {
  ///  Local state fields for this component.

  DateTime? woDate;

  List<String> typeList = [];
  void addToTypeList(String item) => typeList.add(item);
  void removeFromTypeList(String item) => typeList.remove(item);
  void removeAtIndexFromTypeList(int index) => typeList.removeAt(index);
  void insertAtIndexInTypeList(int index, String item) =>
      typeList.insert(index, item);
  void updateTypeListAtIndex(int index, Function(String) updateFn) =>
      typeList[index] = updateFn(typeList[index]);

  List<int> eqptList = [];
  void addToEqptList(int item) => eqptList.add(item);
  void removeFromEqptList(int item) => eqptList.remove(item);
  void removeAtIndexFromEqptList(int index) => eqptList.removeAt(index);
  void insertAtIndexInEqptList(int index, int item) =>
      eqptList.insert(index, item);
  void updateEqptListAtIndex(int index, Function(int) updateFn) =>
      eqptList[index] = updateFn(eqptList[index]);

  int loopCount = 0;

  int loopCount2 = 0;

  int? userID;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for userDD widget.
  String? userDDValue;
  FormFieldController<String>? userDDValueController;
  // Stores action output result for [Backend Call - API (findUserID)] action in userDD widget.
  ApiCallResponse? apiUsersResult;
  DateTime? datePicked;
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
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue8;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue9;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue10;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  WorkOrdersRow? workOrderCreated;
  // Stores action output result for [Backend Call - API (findEquipmentOfType)] action in Button widget.
  ApiCallResponse? apiResult27v;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
