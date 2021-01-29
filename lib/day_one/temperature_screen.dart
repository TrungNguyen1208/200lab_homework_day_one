import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  TextEditingController _controllerC;
  TextEditingController _controllerF;

  @override
  void initState() {
    _controllerC = TextEditingController();
    _controllerF = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controllerC.dispose();
    _controllerF.dispose();
    super.dispose();
  }

  void _onChangeCtoF(String value) {
    if (_controllerC.text == '') {
      _controllerF.text = '';
    }
    double temp = double.parse(value);
    if (temp != null) {
      double result = (temp * 9.0 / 5.0) + 32.0;
      _controllerF.text = result.toStringAsFixed(2);
    } else {
      _controllerF.text = '';
    }
  }

  void _onChangeFtoC(String value) {
    if (_controllerF.text == '') {
      _controllerC.text = '';
    }
    double temp = double.parse(value);
    if (temp != null) {
      double result = (temp - 32.0) * 5.0 / 9.0;
      _controllerC.text = result.toStringAsFixed(2);
    } else {
      _controllerC.text = '';
    }
  }

  void _onPressTranslate(BuildContext context) {
    double temp, result;
    if (_controllerC.text != '') {
      temp = double.parse(_controllerF.text);
      result = temp * 9.0 / 5.0 + 32.0;
      _controllerF.text = result.toStringAsFixed(2);
    } else if (_controllerF.text != '') {
      temp = double.parse(_controllerF.text);
      result = (temp - 32.0) * 5.0 / 9.0;
      _controllerC.text = result.toStringAsFixed(2);
    }
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              TextField(
                controller: _controllerC,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Temperature C'),
                onChanged: _onChangeCtoF,
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: _controllerF,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Temperature F'),
                onChanged: _onChangeFtoC,
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: () => _onPressTranslate(context),
                child: Text('Translate'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
