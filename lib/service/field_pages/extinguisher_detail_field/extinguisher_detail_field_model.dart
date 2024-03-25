import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
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
  FocusNode? typeFocusNode1;
  TextEditingController? typeController1;
  String? Function(BuildContext, String?)? typeController1Validator;
  // State field(s) for type widget.
  FocusNode? typeFocusNode2;
  TextEditingController? typeController2;
  String? Function(BuildContext, String?)? typeController2Validator;
  // State field(s) for mfgDate widget.
  FocusNode? mfgDateFocusNode;
  TextEditingController? mfgDateController;
  String? Function(BuildContext, String?)? mfgDateControllerValidator;
  String? _mfgDateControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter a valid manufactured year';
    }

    if (!RegExp('(19[8-9][1-9]|[2-3][0-9]{3})').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  DateTime? datePicked;
  // State field(s) for rechargeDD widget.
  String? rechargeDDValue;
  FormFieldController<String>? rechargeDDValueController;
  // State field(s) for hydroDD widget.
  String? hydroDDValue;
  FormFieldController<String>? hydroDDValueController;
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
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mfgDateControllerValidator = _mfgDateControllerValidator;
  }

  @override
  void dispose() {
    descrFocusNode?.dispose();
    descrController?.dispose();

    serialFocusNode?.dispose();
    serialController?.dispose();

    typeFocusNode1?.dispose();
    typeController1?.dispose();

    typeFocusNode2?.dispose();
    typeController2?.dispose();

    mfgDateFocusNode?.dispose();
    mfgDateController?.dispose();

    textFieldFocusNode?.dispose();
    textController6?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
