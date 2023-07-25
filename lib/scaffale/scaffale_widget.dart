
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scaffale_model.dart';
export 'scaffale_model.dart';

class ScaffaleWidget extends StatefulWidget {
  const ScaffaleWidget({
    Key? key,
    this.scaffalename,
  }) : super(key: key);

  final DocumentReference? scaffalename;

  @override
  _ScaffaleWidgetState createState() => _ScaffaleWidgetState();
}

class _ScaffaleWidgetState extends State<ScaffaleWidget> {
  late ScaffaleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScaffaleModel());
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed('Upload');
          },
          backgroundColor: FlutterFlowTheme.of(context).primaryText,
          elevation: 8.0,
          child: Container(
            width: 60,
            height: 60,
            child: Icon(
              Icons.add_circle_outline_rounded,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 35.0,
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF00FE0D), Color(0xFF00D1FD)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                verticalDirection: VerticalDirection.down,
                children: [
                  StreamBuilder<List<DepramentRecord>>(
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
                      List<DepramentRecord> listViewDepramentRecordList =
                      snapshot.data!;
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: listViewDepramentRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewDepramentRecord =
                                listViewDepramentRecordList[listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'scaffale_select_path',
                                        queryParams: {
                                          'deparscaffalename': serializeParam(
                                            listViewDepramentRecord.departmentName,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 1.0,
                                      height: 300.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3.0,
                                            color: Color(0x411D2429),
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 1.0, 1.0, 1.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(12.0),
                                                child: Image.network(
                                                  listViewDepramentRecord.departmentCover!,
                                                  width: 150.0,
                                                  height: 150.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(-0.7, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                      8.0, 8.0, 4.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Align(
                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                          child: Text(
                                                            listViewDepramentRecord.departmentName!,
                                                            textAlign: TextAlign.center,
                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                              fontFamily: 'Tajawal',
                                                              color: Color(0xFF090F13),
                                                              fontSize: 20.0,
                                                              fontWeight: FontWeight.w500,
                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

