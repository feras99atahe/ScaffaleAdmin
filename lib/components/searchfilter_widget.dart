import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'searchfilter_model.dart';
export 'searchfilter_model.dart';

class SearchfilterWidget extends StatefulWidget {
  const SearchfilterWidget({Key? key}) : super(key: key);

  @override
  _SearchfilterWidgetState createState() => _SearchfilterWidgetState();
}

class _SearchfilterWidgetState extends State<SearchfilterWidget> {
  late SearchfilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchfilterModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: StreamBuilder<List<DepramentRecord>>(
          stream: queryDepramentRecord(),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                ),
              );
            }
            List<DepramentRecord> choiceChipsDepramentRecordList =
                snapshot.data!;
            return FlutterFlowChoiceChips(
              options: [
                ChipData(FFLocalizations.of(context).getText(
                  '6yj5vp2b' /* petroleum engineering */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  'fxqej6hn' /* chemical engineering */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  'xfp2a5wn' /* civil engineering */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  'cj4xwcrx' /* architectural engineering */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  '6m126k9u' /* information technology enginee... */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  '111qntd5' /* mechanical engineering */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  'b25rqght' /* environmental engineering */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  'qmawgg9b' /* electrical engineering */,
                ))
              ],
              onChanged: (val) async {
                setState(() => _model.choiceChipsValue = val?.first);
                setState(() {
                  FFAppState().searchActive = true;
                });
              },
              selectedChipStyle: ChipStyle(
                backgroundColor: Color(0xFFE3E7ED),
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Cairo',
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
                iconColor: Colors.white,
                iconSize: 18.0,
                elevation: 4.0,
              ),
              unselectedChipStyle: ChipStyle(
                backgroundColor: Color(0xFF232323),
                textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Cairo',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodySmallFamily),
                    ),
                iconColor: Color(0xFFE3E7ED),
                iconSize: 18.0,
                elevation: 4.0,
              ),
              chipSpacing: 20.0,
              multiselect: false,
              alignment: WrapAlignment.spaceEvenly,
              controller: _model.choiceChipsValueController ??=
                  FormFieldController<List<String>>(
                [],
              ),
            );
          },
        ),
      ),
    );
  }
}
