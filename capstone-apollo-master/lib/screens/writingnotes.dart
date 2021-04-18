import 'package:apolloApp/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:apolloApp/database/notes.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:line_icons/line_icons.dart';

class WritingNotes extends StatefulWidget {
  final Notes notes;
  WritingNotes({@required this.notes});

  @override
  _WritingNotesState createState() => _WritingNotesState();
}

class _WritingNotesState extends State<WritingNotes> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  String _noteTitle = "";
  int _noteId = 0;
  String _noteDesc = "";

  FocusNode _titleFocus;
  FocusNode _descFocus;

  bool contentVisible = false;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    if (widget.notes != null) {
      _noteTitle = widget.notes.title;
      _noteDesc = widget.notes.desc;
      _noteId = widget.notes.id;
      contentVisible = true;
    }

    _titleFocus = FocusNode();
    _descFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _titleFocus.dispose();
    _descFocus.dispose();
    super.dispose();
  }

  //FocusNode _focusInput2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*body: SafeArea(
        child: KeyboardActions(
          config: KeyboardActionsConfig(
            nextFocus: false,
            keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
            keyboardBarColor: Color(0xFFDAC4F7),
            actions: [
              KeyboardActionsItem(
                focusNode: _focusInput2,
                toolbarButtons: [
                  (_) {
                    return GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(Icons.keyboard_return_rounded),
                      ),
                      onTap: () => TextInputAction.newline,
                    );
                  },
                ],
              ),
            ],
          ),*/
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      bottom: 12.0,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Icon(Icons.arrow_back_ios_rounded),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            focusNode: _titleFocus,
                            onSubmitted: (value) async {
                              if (value != "") {
                                if (widget.notes == null) {
                                  Notes _newNotes = Notes(title: value);
                                  _noteId =
                                      await _dbHelper.insertNote(_newNotes);
                                  setState(() {
                                    contentVisible = true;
                                    _noteTitle = value;
                                  });
                                } else {
                                  await _dbHelper.updateNoteTitle(
                                      _noteId, value);
                                  print("Note Updated");
                                }
                                _descFocus.requestFocus();
                              }
                            },
                            controller: TextEditingController()
                              ..text = _noteTitle,
                            decoration: InputDecoration(
                              hintText: "Enter Title",
                              border: InputBorder.none,
                            ),
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: contentVisible,
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.done,
                      maxLines: null,
                      onSubmitted: (value) async {
                        if (value != '') {
                          if (_noteId != 0) {
                            await _dbHelper.updateNoteDesc(_noteId, value);
                            _noteDesc = value;
                          }
                        }
                        _descFocus.requestFocus();
                      },
                      controller: TextEditingController()..text = _noteDesc,
                      decoration: InputDecoration(
                        hintText: "Tell me about your day!",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 24),
                      ),
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      //focusNode: _focusInput2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      //),
      //),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Icon(
              LineIcons.trash,
              size: 32,
              color: Colors.white,
            ),
            label: "Delete Notebook",
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Color(0xFFF4989C),
            onTap: () {
              showDialog(
                  builder: (_) => AlertDialog(
                        title: Text("Delete?"),
                        content: Text(
                            "Are you sure you want to delete this note? This action cannot be undone."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("No"),
                          ),
                          TextButton(
                            onPressed: () async {
                              if (_noteId != 0) {
                                await _dbHelper.deleteNote(_noteId);
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                              }
                            },
                            child: Text("Yes"),
                          ),
                        ],
                        elevation: 24.0,
                      ),
                  barrierDismissible: true,
                  context: context);
            },
          ),
        ],
      ),
    );
  }
}
