import 'dart:async';

import 'package:loginandsignup/domain/model/data/bank_sampah/bank_sampah_data.dart';

class CounterBloc {
  int _counter = 0;
  int _counter1 = 0;
  int _counter2 = 0;
  int _counter3 = 0;

  int get counter => _counter;
  int get counter1 => _counter1;
  int get counter2 => _counter2;
  int get counter3 => _counter3;

  final StreamController _inputController = StreamController();
  StreamSink get inputan => _inputController.sink;

  final StreamController _outputController = StreamController();
  StreamSink get _sinkOut => _outputController.sink;

  final StreamController _input1Controller = StreamController();
  StreamSink get inputan1 => _input1Controller.sink;

  final StreamController _output1Controller = StreamController();
  StreamSink get _sinkOut1 => _output1Controller.sink;

  final StreamController _input2Controller = StreamController();
  StreamSink get inputan2 => _input2Controller.sink;

  final StreamController _output2Controller = StreamController();
  StreamSink get _sinkOut2 => _output2Controller.sink;

  final StreamController _input3Controller = StreamController();
  StreamSink get inputan3 => _input3Controller.sink;

  final StreamController _output3Controller = StreamController();
  StreamSink get _sinkOut3 => _output3Controller.sink;

  Stream get output => _outputController.stream;
  Stream get output1 => _output1Controller.stream;
  Stream get output2 => _output2Controller.stream;
  Stream get output3 => _output3Controller.stream;

  CounterBloc() {
    _inputController.stream.listen((event) {
      if (event == 'add') {
        _counter++;
      } else if (_counter > 0) {
        _counter--;
      }

      _sinkOut.add(_counter);
    });
    _input1Controller.stream.listen((event) {
      if (event == 'add1') {
        _counter1++;
      } else if (_counter1 > 0) {
        _counter1--;
      }

      _sinkOut1.add(_counter1);
    });
    _input2Controller.stream.listen((event) {
      if (event == 'add2') {
        _counter2++;
      } else if (_counter2 > 0) {
        _counter2--;
      }

      _sinkOut2.add(_counter2);
    });
    _input3Controller.stream.listen((event) {
      if (event == 'add3') {
        _counter3++;
      } else if (_counter3 > 0) {
        _counter3--;
      }

      _sinkOut3.add(_counter3);
    });
  }
  void dispose() {
    _inputController.close();
    _outputController.close();
    _input1Controller.close();
    _output1Controller.close();
    _input2Controller.close();
    _output2Controller.close();
    _input3Controller.close();
    _output3Controller.close();
  }

  int countTotalPoint(List<BankSampahData> bankSampahData) {
    int point1 =
        bankSampahData.firstWhere((element) => element.type == 1).point *
            _counter;
    print(point1);
    print(_counter);
    int point2 =
        bankSampahData.firstWhere((element) => element.type == 2).point *
            _counter1;
    print(point2);
    print(_counter1);
    int point3 =
        bankSampahData.firstWhere((element) => element.type == 3).point *
            _counter2;
    print(point3);
    print(_counter2);
    int point4 =
        bankSampahData.firstWhere((element) => element.type == 4).point *
            _counter3;
    print(point4);
    print(_counter3);
    return point1 + point2 + point3 + point4;
  }
}
