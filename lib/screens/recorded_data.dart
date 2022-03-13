import 'package:fishies_sih/screens/saved_data.dart';
import 'package:flutter/material.dart';
import 'package:fishies_sih/utils/constants.dart' as constants;
import 'package:fishies_sih/utils/colors.dart' as colors;
import '../widgets/appbar_with_back_button.dart';

class RecordDataPage extends StatefulWidget {
  const RecordDataPage({Key? key}) : super(key: key);

  @override
  _RecordDataPageState createState() => _RecordDataPageState();
}

class _RecordDataPageState extends State<RecordDataPage> {
  var landingsMap = {
    'species': 'Fish species name',
    'location': 'Sector 1',
    'weight': 30,
    'imagePath': 'https://www.newhopelanding.com/app/uploads/2019/11/1024.png'
  };
  @override
  Widget build(BuildContext context) {
    var allLandingsMap = [
      landingsMap,
      landingsMap,
      landingsMap,
      landingsMap
    ];
    return Scaffold(
      appBar: const AppBarBackButton('Recorded Data'),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: allLandingsMap.length,
                    itemBuilder: (context, index){
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: const Color(0xff5D79DC),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(allLandingsMap[index]['species'].toString(), style: constants.textNormalStyle,),
                            SizedBox(height: 10,),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                allLandingsMap[index]['imagePath'].toString(),
                                height: 250,
                                width: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text('Today\'s catch:', style: constants.textNormalStyle, textAlign: TextAlign.start,),
                                    Text('Location:', style: constants.textNormalStyle,textAlign: TextAlign.start)
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                                const SizedBox(width: 40,),
                                Column(
                                  children: [
                                    Text(allLandingsMap[index]['weight'].toString(), style: constants.textNormalStyle, textAlign: TextAlign.end),
                                    Text(allLandingsMap[index]['location'].toString(), style: constants.textNormalStyle, textAlign: TextAlign.end)
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SavedDataPage()));
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
