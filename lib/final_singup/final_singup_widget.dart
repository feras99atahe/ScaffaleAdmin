import '/components/signup_bottomsheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'final_singup_model.dart';
export 'final_singup_model.dart';

class FinalSingupWidget extends StatefulWidget {
  const FinalSingupWidget({Key? key}) : super(key: key);

  @override
  _FinalSingupWidgetState createState() => _FinalSingupWidgetState();
}

class _FinalSingupWidgetState extends State<FinalSingupWidget> {
  late FinalSingupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FinalSingupModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (bottomSheetContext) {
                      return GestureDetector(
                        onTap: () =>
                            FocusScope.of(context).requestFocus(_unfocusNode),
                        child: Padding(
                          padding: MediaQuery.of(bottomSheetContext).viewInsets,
                          child: Container(
                            height: 430.0,
                            child: SignupBottomsheetWidget(),
                          ),
                        ),
                      );
                    },
                  ).then((value) => setState(() {}));
                },
                child: Container(
                  width: double.infinity,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF232323),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 80.0,
                          child: Divider(
                            height: 2.0,
                            thickness: 3.0,
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.03, -0.68),
              child: Text(
                FFLocalizations.of(context).getText(
                  'jj07mmy9' /* Make your's Account */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Cairo',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w200,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.15),
              child: Image.asset(
                'assets/images/amico.png',
                width: double.infinity,
                height: 300.0,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
