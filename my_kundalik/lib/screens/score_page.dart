import 'package:my_kundalik/core/components/input_comp.dart';
import 'package:my_kundalik/core/constants/const.dart';
import 'package:my_kundalik/model/subject_model.dart';
import 'package:my_kundalik/widgets/app_bar.dart';
import 'package:my_kundalik/widgets/scaffold_messanger.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  final String username;
  const ScorePage({Key? key, required this.username}) : super(key: key);

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  int? _scoreValue;
  final TextEditingController _subjectController = TextEditingController();
  final List<DropdownMenuItem<int>> _dropDowns = const [
    DropdownMenuItem<int>(
      child: Text("100"),
      value: 100,
    ),
    DropdownMenuItem<int>(
      child: Text("60"),
      value: 60,
    ),
    DropdownMenuItem<int>(
      child: Text("30"),
      value: 30,
    ),
  ];
  List<SubjectModel> _subjects = [];

  final _subjectKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: MyAppBar.appBar("Name -> ${widget.username}"),
      body: Padding(
        padding: PaddingMarginConst.kExtraLargePadding,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  TextFormField(
                    key: _subjectKey,
                    controller: _subjectController,
                    decoration: InputComp.inputDecoration(
                      hintText: 'Fan nomini kiriting...',
                      labelText: 'Fan Nomi...',
                      suffixIcon: const Icon(Icons.science),
                    ),
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "Fan Nomi Bo'sh Bo'lmasin !!!";
                      }
                    },
                  ),
                  Container(
                    margin: PaddingMarginConst.kMediumPadding,
                    padding: PaddingMarginConst.kExtraSmallPadding,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorConst.kPrimaryColor,
                      ),
                      borderRadius:
                          BorderRadius.circular(RadiusConst.kLargeRadius),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        items: _dropDowns,
                        value: _scoreValue,
                        hint: const Text("Bahoni tanlang"),
                        onChanged: (value) {
                          setState(() {
                            _scoreValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                  OutlinedButton(
                    child: const Text("Fanni Qo'shish"),
                    onPressed: () {
                      if (_subjectKey.currentState!.validate()) {
                        if (_scoreValue != null) {
                          _subjects.add(
                            SubjectModel(
                              name: _subjectController.text,
                              score: _scoreValue,
                            ),
                          );
                          _subjectController.clear();
                          _scoreValue = null;
                          setState(() {});
                        } else {
                          MyMessenger.showMyMessenger(
                              "Bahoni Tanlashingiz Shart !!", context);
                        }
                      }
                    },
                  )
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: _subjects.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (_, __) {
                        return Stack(
                          children: [
                            Container(
                              margin: PaddingMarginConst.kExtraSmallPadding,
                              color: Colors.redAccent,
                              child: Dismissible(
                                direction: DismissDirection.endToStart,
                                onDismissed: (index) {
                                  setState(() {
                                    _subjects.removeAt(__);
                                  });
                                },
                                key: UniqueKey(),
                                child: Card(
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: ColorConst.kPrimaryColor,
                                      child: Text(
                                        _subjects[__].score.toString(),
                                      ),
                                    ),
                                    title: Text(
                                      _subjects[__].name.toString(),
                                    ),
                                    trailing: const Icon(Icons.delete),
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 25,
                              right: 10,
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: _subjects.length,
                    )
                  : const Center(
                      child: Text("Fanlar shu yerda ko'rinadi !"),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}