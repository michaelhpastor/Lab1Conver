import 'package:flutter/material.dart';

class BeerApp extends StatefulWidget {
  const BeerApp({super.key});

  @override
  State<BeerApp> createState() => _BeerAppState();
}

class _BeerAppState extends State<BeerApp> {
  final List<String> opciones = ['light', 'Amber'];
  String _opcionSelecc = 'light';
  int xd = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Beer Adviser'),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(             
              children: [
                Container(
                  child: DropdownButton(
                  value: _opcionSelecc,
                  onChanged: (String? newValue) {
                    setState(() {
                      _opcionSelecc = newValue!;
                      xd = 0;
                    });
                  },
                  items: 
                  opciones.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value)
                    );
                  }).toList()
                  ),
                ),
                Container(
                  child: TextButton(
                    onPressed: (){
                      _mostrarCervezas(_opcionSelecc);
                    },
                    child: Text('Search Beer')
                  ),
                ),
                (xd==1)?Column(children: [Text('Jail Pale Ale'), Text('Gout Stout')]):Container(),
                (xd==2)?Column(children: [Text('Jack Amber'), Text('Red Moose')]):Container()
              ], //Children
            ),
          ),
        )
    );
  }

  
  
  void _mostrarCervezas(String selelccion){
    if(selelccion == 'light'){
      setState(() {
        xd = 1;
      });
    }else{
      setState(() {
        xd = 2;
      });
    }
  }

}