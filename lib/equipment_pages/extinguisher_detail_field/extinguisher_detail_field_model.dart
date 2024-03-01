import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'extinguisher_detail_field_widget.dart'
    show ExtinguisherDetailFieldWidget;
import 'package:flutter/material.dart';

class ExtinguisherDetailFieldModel
    extends FlutterFlowModel<ExtinguisherDetailFieldWidget> {
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
  // State field(s) for descr widget.
  FocusNode? descrFocusNode;
  TextEditingController? descrController;
  String? Function(BuildContext, String?)? descrControllerValidator;
  // State field(s) for serial widget.
  FocusNode? serialFocusNode;
  TextEditingController? serialController;
  String? Function(BuildContext, String?)? serialControllerValidator;
  // State field(s) for type widget.
  FocusNode? typeFocusNode;
  TextEditingController? typeController;
  String? Function(BuildContext, String?)? typeControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<EqptWoLisRow>? matchedWoLis;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descrFocusNode?.dispose();
    descrController?.dispose();

    serialFocusNode?.dispose();
    serialController?.dispose();

    typeFocusNode?.dispose();
    typeController?.dispose();

    textFieldFocusNode?.dispose();
    textController4?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
