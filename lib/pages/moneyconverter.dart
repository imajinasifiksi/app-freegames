import 'package:flutter/material.dart';

class MoneyConv extends StatefulWidget {
  const MoneyConv({Key? key}) : super(key: key);

  @override
  _MoneyConvState createState() => _MoneyConvState();
}

class _MoneyConvState extends State<MoneyConv> {
  late double _input;
  late double _output;
  // currency IDR, USD, EUR, JPY
  late String _currencyInput;
  late String _currencyOutput;
  late String _result;

  final TextEditingController _inputController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _input = 0;
    _currencyInput = 'IDR';
    _currencyOutput = 'IDR';
    _result = '';
  }

  void _onInputChanged(String value) {
    setState(() {
      _input = double.tryParse(value) ?? 0;
    });
  }

  void _onCurrencyInputChanged(String? value) {
    setState(() {
      _currencyInput = value ?? 'IDR';
    });
  }

  void _onCurrencyOutputChanged(String? value) {
    setState(() {
      _currencyOutput = value ?? 'IDR';
    });
  }

  void _convert() {
    setState(() {
      switch (_currencyInput) {
        case 'IDR':
          switch (_currencyOutput) {
            case 'IDR':
              _output = _input;
              break;
            case 'USD':
              _output = _input / 14200;
              break;
            case 'EUR':
              _output = _input / 17000;
              break;
            case 'JPY':
              _output = _input / 130;
              break;
          }
          break;
        case 'USD':
          switch (_currencyOutput) {
            case 'IDR':
              _output = _input * 14200;
              break;
            case 'USD':
              _output = _input;
              break;
            case 'EUR':
              _output = _input * 0.85;
              break;
            case 'JPY':
              _output = _input * 110;
              break;
          }
          break;
        case 'EUR':
          switch (_currencyOutput) {
            case 'IDR':
              _output = _input * 17000;
              break;
            case 'USD':
              _output = _input * 1.17;
              break;
            case 'EUR':
              _output = _input;
              break;
            case 'JPY':
              _output = _input * 130;
              break;
          }
          break;
        case 'JPY':
          switch (_currencyOutput) {
            case 'IDR':
              _output = _input * 130;
              break;
            case 'USD':
              _output = _input * 0.0091;
              break;
            case 'EUR':
              _output = _input * 0.0077;
              break;
            case 'JPY':
              _output = _input;
              break;
          }
          break;
      }
      _result = _output.toStringAsFixed(2);
    });
  }

  @override
  // make dropdown button without array looping

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : const Text('Money Converter', style: TextStyle(
          fontSize: 18,
          fontFamily: 'Sans-Serif',
          fontWeight: FontWeight.bold),
          ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: _onInputChanged,
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),

                ),
                labelText: 'Input',

              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButton<String>(
              value: _currencyInput,
              onChanged: _onCurrencyInputChanged,
              items: const <String>['IDR', 'USD', 'EUR', 'JPY'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButton<String>(
              value: _currencyOutput,
              onChanged: _onCurrencyOutputChanged,
              items: const <String>['IDR', 'USD', 'EUR', 'JPY'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(

                  value: value,
                  child: Text(value,style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                // primary: Color.fromRGBO(49, 39, 79, 1),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: _convert,
              child: const Text('Convert',style: TextStyle(
                color: Colors.white,
              ),),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              _result,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
