
/*
 * LoadingData
 * Shows that the information is being loaded 
 */

import 'package:flutter/material.dart';

class LoadingData extends StatelessWidget {

  const LoadingData({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: const [
        LinearProgressIndicator(
          minHeight: 10,
        ),
        Expanded(
          child: Center(
            child: Text('Espere por favor'),
          ),
        )
      ],
    );
  }
}