import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'scaffalefile_model.dart';
export 'scaffalefile_model.dart';

class ScaffalefileWidget extends StatefulWidget {
  const ScaffalefileWidget({
    Key? key,
    this.departmentname,
  }) : super(key: key);

  final String? departmentname;

  @override
  _ScaffalefileWidgetState createState() => _ScaffalefileWidgetState();
}

class _ScaffalefileWidgetState extends State<ScaffalefileWidget> {
  late ScaffalefileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScaffalefileModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed('Upload');
          },
          backgroundColor: FlutterFlowTheme.of(context).primaryText,
          elevation: 8,
          child: Icon(
            Icons.add_circle_outline_rounded,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            size: 35,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder<List<FavoriteRecord>>(
                      stream: queryFavoriteRecord(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Image.asset( 'assets/images/Mystery box.gif');
                        }
                        List<FavoriteRecord> listViewFavoriteRecordList =
                        snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewFavoriteRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewFavoriteRecord =
                            listViewFavoriteRecordList[listViewIndex];
                            return Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: StreamBuilder<DataRecord>(
                                stream: DataRecord.getDocument(
                                    listViewFavoriteRecord.item!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                    );
                                  }
                                  final containerDataRecord = snapshot.data!;
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'review',
                                        queryParams: {
                                          'bookdetail': serializeParam(
                                            containerDataRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3,
                                            color: Color(0x32000000),
                                            offset: Offset(0, 1),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8),
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(0),
                                            ),
                                            child: Image.network(
                                              containerDataRecord.bookcover!,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                12, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  containerDataRecord.booktitle!,
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .displaySmall,
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 4, 0, 0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          containerDataRecord
                                                              .departmentfilter
                                                              ?.first,
                                                          'd',
                                                        ),
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodySmall
                                                            .override(
                                                          fontFamily:
                                                          'Outfit',
                                                          color: Color(
                                                              0xFF7C8791),
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight
                                                              .normal,
                                                          useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                              .containsKey(
                                                              FlutterFlowTheme.of(context)
                                                                  .bodySmallFamily),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
