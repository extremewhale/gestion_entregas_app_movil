import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gestion_entrega_app/pages/store/wallet/createCard/store_wallet_createCard_controller.dart';
import 'package:get/get.dart';

class StoreWalletCreateCardPage extends StatelessWidget {
  const StoreWalletCreateCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(StoreWalletCreateCardController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagos'),
      ),
      body: ListView(
        children: [
          Obx(
            () => CreditCardWidget(
              cardNumber: _con.cardNumber.value,
              expiryDate: _con.expiryDate.value,
              cardHolderName: _con.cardHolderName.value,
              cvvCode: _con.cvvCode.value,
              showBackView: _con.isCvvFocused.value,
              cardBgColor: Colors.amber.shade500,
              onCreditCardWidgetChange: (CreditCardBrand brand) {},
              obscureCardNumber: true,
              obscureCardCvv: true,
              labelCardHolder: 'CARD HOLDER',
              isHolderNameVisible: true,
              isChipVisible: true,
              animationDuration: Duration(milliseconds: 1000),
            ),
          ),
          CreditCardForm(
            formKey: _con.keyForm, // Required
            cardNumber: '', // Required
            expiryDate: '', // Required
            cardHolderName: '', // Required
            cvvCode: '', // Required
            onCreditCardModelChange: _con.onCreditCardModelChanged,
            obscureCvv: true,
            obscureNumber: true,
            isHolderNameVisible: true,
            isCardNumberVisible: true,
            isExpiryDateVisible: true,
            enableCvv: true,
            cvvValidationMessage: 'Please input a valid CVV',
            dateValidationMessage: 'Please input a valid date',
            numberValidationMessage: 'Please input a valid number',
            cardNumberValidator: (String? cardNumber) {},
            expiryDateValidator: (String? expiryDate) {},
            cvvValidator: (String? cvv) {},
            cardHolderValidator: (String? cardHolderName) {},
            onFormComplete: () {
              // callback to execute at the end of filling card data
            },
            autovalidateMode: AutovalidateMode.always,
            disableCardNumberAutoFillHints: false,
            inputConfiguration: const InputConfiguration(
              cardNumberDecoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Number',
                hintText: 'XXXX XXXX XXXX XXXX',
              ),
              expiryDateDecoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Expired Date',
                hintText: 'XX/XX',
              ),
              cvvCodeDecoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'CVV',
                hintText: 'XXX',
              ),
              cardHolderDecoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Card Holder',
              ),
              cardNumberTextStyle: TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
              cardHolderTextStyle: TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
              expiryDateTextStyle: TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
              cvvCodeTextStyle: TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
            ),
          ),
          _DocumentInfo(),
          _buttonNext()
        ],
      ),
    );
  }

  Widget _DocumentInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Material(
              elevation: 2.0,
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DropdownButton(
                        value: '',
                        onChanged: (option) {},
                        items: [],
                        elevation: 3,
                        underline: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_drop_down_circle,
                            color: Colors.amber.shade50,
                          ),
                        ),
                        isExpanded: true,
                        hint: const Text(
                          'Tipo doc',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Flexible(
            flex: 4,
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numero de documento'),
            ),
          )
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>>? dropDownItems(documentType) {
    List<DropdownMenuItem<String>> list = [];
    documentType.forEach((Document) {
      list.add(DropdownMenuItem(
          value: '',
          child: Container(
            margin: EdgeInsets.only(top: 7),
            child: Text('Document.name!'),
          )));
    });
    return list;
  }

  Widget _buttonNext() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber.shade400,
            padding: const EdgeInsets.symmetric(vertical: 5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  child: const Text(
                    'CONTINUAR',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 50, top: 6),
                height: 30,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
