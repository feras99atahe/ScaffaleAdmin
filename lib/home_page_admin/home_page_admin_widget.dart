import '/backend/backend.dart';
import '/components/view_book_info_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_admin_model.dart';
export 'home_page_admin_model.dart';

class HomePageAdminWidget extends StatefulWidget {
  const HomePageAdminWidget({
    Key? key,
    this.bookcover,
  }) : super(key: key);

  final String? bookcover;

  @override
  _HomePageAdminWidgetState createState() => _HomePageAdminWidgetState();
}

class _HomePageAdminWidgetState extends State<HomePageAdminWidget> {
  late HomePageAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageAdminModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed('Upload');
          },
          backgroundColor: FlutterFlowTheme.of(context).primaryText,
          elevation: 8.0,
          child: Icon(
            Icons.add_circle_outline,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            size: 30.0,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0x15FFFFFF),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                        child: SelectionArea(
                            child: Text(
                          FFLocalizations.of(context).getText(
                            'ddipfzdy' /* Upload Request */,
                          ),
                          textAlign: TextAlign.end,
                          style: FlutterFlowTheme.of(context).displaySmall,
                        )),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 300.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: StreamBuilder<List<DataRecord>>(
                          stream: queryDataRecord(
                            queryBuilder: (dataRecord) => dataRecord
                                .where('bookstatus', isEqualTo: 'pending'),
                          ),
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
                            List<DataRecord> listViewDataRecordList =
                                snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: listViewDataRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewDataRecord =
                                    listViewDataRecordList[listViewIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'file_check_admin',
                                      queryParams: {
                                        'bookcheck': serializeParam(
                                          listViewDataRecord.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xFF292828),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          valueOrDefault<String>(
                                            listViewDataRecord.bookcover,
                                            'https://img.freepik.com/free-photo/book-library-with-old-open-textbook-stack-piles-literature-text-archive-reading-desk_1150-9086.jpg?w=1380&t=st=1679071713~exp=1679072313~hmac=bcb06bf370ee2d1aa5fe8e631608af645f5442b918422c23fbf401a82e4e8502',
                                          ),
                                          width: 170.0,
                                          height: 230.0,
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            listViewDataRecord.booktitle!,
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: Colors.black,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              listViewDataRecord.author!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color: Colors.black,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 600.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 40.0, 8.0, 8.0),
                                    child: SelectionArea(
                                        child: Text(
                                      FFLocalizations.of(context).getText(
                                        'toz49tj9' /* Last File */,
                                      ),
                                      textAlign: TextAlign.end,
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall,
                                    )),
                                  ),
                                ),
                                StreamBuilder<List<DataRecord>>(
                                  stream: queryDataRecord(
                                    queryBuilder: (dataRecord) =>
                                        dataRecord.where('bookstatus',
                                            isEqualTo: 'approved'),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      );
                                    }
                                    List<DataRecord> containerDataRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final containerDataRecord =
                                        containerDataRecordList.isNotEmpty
                                            ? containerDataRecordList.first
                                            : null;
                                    return Container(
                                      width: double.infinity,
                                      height: 300.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: StreamBuilder<List<DataRecord>>(
                                          stream: queryDataRecord(
                                            queryBuilder: (dataRecord) =>
                                                dataRecord
                                                    .where('bookstatus',
                                                        isEqualTo: 'approved')
                                                    .orderBy('created'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<DataRecord>
                                                listViewDataRecordList =
                                                snapshot.data!;
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  listViewDataRecordList.length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewDataRecord =
                                                    listViewDataRecordList[
                                                        listViewIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Color(0xFF212225),
                                                      barrierColor:
                                                          Color(0x00000000),
                                                      enableDrag: false,
                                                      context: context,
                                                      builder:
                                                          (bottomSheetContext) {
                                                        return GestureDetector(
                                                          onTap: () => FocusScope
                                                                  .of(context)
                                                              .requestFocus(
                                                                  _unfocusNode),
                                                          child: Padding(
                                                            padding: MediaQuery.of(
                                                                    bottomSheetContext)
                                                                .viewInsets,
                                                            child: Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.4,
                                                              child:
                                                                  ViewBookInfoWidget(),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  },
                                                  child: Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: Color(0xFF292828),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewDataRecord
                                                                .bookcover,
                                                            'https://img.freepik.com/free-photo/book-library-with-old-open-textbook-stack-piles-literature-text-archive-reading-desk_1150-9086.jpg?w=1380&t=st=1679071713~exp=1679072313~hmac=bcb06bf370ee2d1aa5fe8e631608af645f5442b918422c23fbf401a82e4e8502',
                                                          ),
                                                          width: 170.0,
                                                          height: 230.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            listViewDataRecord
                                                                .booktitle!,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              listViewDataRecord
                                                                  .author!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
