import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../bo/cart.dart';

class PaymentPage extends StatelessWidget{

  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finalisation de la commande"),
      ),
      body: Column(
        children: [

          const DetailsCart(),

          //Adresse
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Adresse de livraison", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all(color: Theme.of(context).colorScheme.outline,),
                borderRadius: BorderRadius.circular(12.0),),

              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Bernard le cafard', style: TextStyle(
                          fontWeight: FontWeight.bold)),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('28 rue des Voyés'),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('12456 Chaispas'),

                    ],
                  ),

                ],
              ),
            ),
          ),

          //Moyen paiment
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Méthode de paiement", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
            ],
          ),
          const PaymentSelection(),

          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Achat confirmé'),
                ),
              ),

              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Theme.of(context).colorScheme.background ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Theme.of(context).colorScheme.outline),
                  )
              ) ,
              child: const Text("Confirmer l'achat"),
            ),
          ),
        ],),

    );
  }


}

//Recap commande
class DetailsCart extends StatelessWidget {
  const DetailsCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, _) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration( border: Border.all(color: Theme.of(context).colorScheme.outline,),
            borderRadius: BorderRadius.circular(12.0),
          ),

          child:  Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Récapitulatif de votre commande', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:16 ),),

                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Sous-total'),
                  Text(cart.priceTotalInEuro())
                ],
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Vous économisez'),
                  Text('0.00€')
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('TVA'),
                  Text(cart.tva())
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('TOTAL', style: TextStyle(
                  fontWeight: FontWeight.bold),),
                  Text(cart.totalTva(), style: const TextStyle(
                      fontWeight: FontWeight.bold))
                ],
              ),


            ],

          ),
        ),
      ),
    );
  }



}

class PaymentSelection extends StatefulWidget {
  const PaymentSelection({super.key});

  @override
  _PaymentSelectionState createState() => _PaymentSelectionState();
}

class _PaymentSelectionState extends State<PaymentSelection> {
  bool _isVisaSelected = false;
  bool _isMCSelected = false;
  bool _isPaypalSelected = false;
  bool _isAppleSelected = false;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(

              onTap: () {_isPaypalSelected = false;
              _isVisaSelected = true;
              _isMCSelected = false;
              _isAppleSelected = false;},
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: _isVisaSelected?Theme.of(context).primaryColor:Theme.of(context).colorScheme.outline),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Icon(FontAwesomeIcons.ccVisa, size: 55.0),


                  ],
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {_isPaypalSelected = false;
              _isVisaSelected = false;
              _isMCSelected = false;
              _isAppleSelected = true;},
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: _isAppleSelected?Theme.of(context).primaryColor:Theme.of(context).colorScheme.outline),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  children: [
                    Icon(FontAwesomeIcons.applePay, size: 55.0),


                  ],
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                _isPaypalSelected = false;
                _isVisaSelected = false;
                _isMCSelected = true;
                _isAppleSelected = false;
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: _isMCSelected?Theme.of(context).primaryColor:Theme.of(context).colorScheme.outline),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Icon(FontAwesomeIcons.ccMastercard, size: 55.0),


                  ],
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {_isPaypalSelected = true;
              _isVisaSelected = false;
              _isMCSelected = false;
              _isAppleSelected = false;
                },
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: _isPaypalSelected?Theme.of(context).primaryColor:Theme.of(context).colorScheme.outline),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  children: [
                    Icon(FontAwesomeIcons.paypal, size: 55.0),


                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}




