import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:unisis/islemler/c_getir.dart';

class deneme extends StatefulWidget {

  @override
  _denemeState createState() => _denemeState();
}

class _denemeState extends State<deneme> {

  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;
  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    int intDersKodu =0;
    double dblVize=0;
    double dblFinal=0;
    List<BarChartGroupData> itemNotlar = [];
    CollectionReference duyurularRef = getirNotlarDT();
    print ("Test");
    getirNotlarDT().where('n_ogr_no',isEqualTo: '2').orderBy('n_ders_no').snapshots().listen((event) {event.docs.forEach((element) {
      print ("Test1");
      print(element.id);
      print(element.get('n_ogr_no'));
      print(element.get('n_ogr_no'));
      if (element.get('n_ders_no')!='') intDersKodu=int.parse(element.get('n_ders_no')); else intDersKodu = 0;
      if (element.get('n_vize')!='') dblVize=double.parse(element.get('n_vize')); else dblVize = 0;
      if (element.get('n_final')!='') dblFinal=double.parse(element.get('n_final')); else dblFinal = 0;

      itemNotlar.add(makeGroupData(intDersKodu,dblVize,dblFinal));
      print ("$intDersKodu $dblVize $dblFinal");
    });});
    rawBarGroups = itemNotlar;
    showingBarGroups = rawBarGroups;

    return Scaffold(
      appBar: AppBar(title: Text("Denene kısmı"),),
      body: AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: const Color(0xff2c4260),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  makeTransactionsIcon(),
                  const SizedBox(
                    width: 38,
                  ),
                  const Text(
                    'Notlar Durum',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Vize-Final',
                    style: TextStyle(color: Color(0xff77839a), fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 38,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BarChart(
                    BarChartData(
                      maxY: 105,
                      barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.grey,
                            getTooltipItem: (_a, _b, _c, _d) => null,
                          ),
                          touchCallback: (response) {
                            if (response.spot == null) {
                              setState(() {
                                touchedGroupIndex = -1;
                                showingBarGroups = List.of(rawBarGroups);
                              });
                              return;
                            }

                            touchedGroupIndex = response.spot.touchedBarGroupIndex;

                            setState(() {
                              if (response.touchInput is PointerExitEvent ||
                                  response.touchInput is PointerUpEvent) {
                                touchedGroupIndex = -1;
                                showingBarGroups = List.of(rawBarGroups);
                              } else {
                                showingBarGroups = List.of(rawBarGroups);
                                if (touchedGroupIndex != -1) {
                                  var sum = 0.0;
                                  for (var rod in showingBarGroups[touchedGroupIndex].barRods) {
                                    sum += rod.y;
                                  }
                                  final avg =
                                      sum / showingBarGroups[touchedGroupIndex].barRods.length;

                                  showingBarGroups[touchedGroupIndex] =
                                      showingBarGroups[touchedGroupIndex].copyWith(
                                        barRods: showingBarGroups[touchedGroupIndex].barRods.map((rod) {
                                          return rod.copyWith(y: avg);
                                        }).toList(),
                                      );
                                }
                              }
                            });
                          }),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                          showTitles: true,
                          getTextStyles: (value) => const TextStyle(
                              color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                          margin: 20,
                          getTitles: (double value) {
                            switch (value.toInt()) {
                             // case 0:
                              //  return 'Mn';
                              case 1:
                                return 'Mobil\nProgramlama';
                              case 2:
                                return 'Ayrık\nMatematik';
                              case 3:
                                return 'Yazılım\nMühendisliği';
                              case 4:
                                return 'Mantık\nDevreleri 2';
                              case 5:
                                return 'İşletim\nSistemleri';
                              case 6:
                                return 'Sn';
                              default:
                                return '';
                            }
                          },
                        ),
                        leftTitles: SideTitles(
                          showTitles: true,
                          getTextStyles: (value) => const TextStyle(
                              color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                          margin: 32,
                          reservedSize: 14,
                          getTitles: (value) {
                            if (value == 0) {
                              return '0';
                            } else if (value == 10) {
                              return '10';
                            } else if (value == 20) {
                              return '20';
                            } else if (value == 30) {
                              return '30';
                            } else if (value == 40) {
                              return '40';
                            } else if (value == 50) {
                              return '50';
                            } else if (value == 60) {
                              return '60';
                            } else if (value == 70) {
                              return '70';
                            } else if (value == 80) {
                              return '80';
                            } else if (value == 90) {
                              return '90';
                            } else if (value == 100) {
                              return '100';
                            } else {
                              return '';
                            }
                          },
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: showingBarGroups,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 8, x: x, barRods: [
      BarChartRodData(
        y: y1,
        colors:y1<50 ? [Colors.red]:[Colors.blue],
        width: 21,
      ),
      BarChartRodData(
        y: y2,
        colors:y2<50 ? [Colors.red]:[Colors.blue],
        width: 21,
      ),
    ]);
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}