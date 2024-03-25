import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'lookup_equipment_model.dart';
export 'lookup_equipment_model.dart';

class LookupEquipmentWidget extends StatefulWidget {
  const LookupEquipmentWidget({super.key});

  @override
  State<LookupEquipmentWidget> createState() => _LookupEquipmentWidgetState();
}

class _LookupEquipmentWidgetState extends State<LookupEquipmentWidget> {
  late LookupEquipmentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LookupEquipmentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
