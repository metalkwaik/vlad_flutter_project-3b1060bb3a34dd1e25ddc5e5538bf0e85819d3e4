import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/my_text_field/my_text_field.dart';
import 'home_controller/home_controller.dart';

const List<Widget> _listWidgets = [_Delivery(), _Pickup()];
const List<String> _listTitle = [
   'Укажети адресс доставки' ,
   'Укажети откуда забирете' ,
  ];

final widgets = List.generate(
  _listWidgets.length,
  (index) => Column(
    children: [
      if (_listTitle.length > index)
        Column(
          children: [
            const SizedBox(height: 18),
            _Title(title: _listTitle[index], size: 32),
            const SizedBox(height: 9),
          ],
        ),
      _listWidgets[index],
      const SizedBox(height: 18),
      const _Title(title: 'Способ оплаты', size: 22),
      const SizedBox(height: 9),
      const _SposopPay(),
    ],
  ),
);

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    return IndexedStack(
      index: controller.currentIndexPage,
      children: widgets,
    );
  }
}


class _Delivery extends StatelessWidget {
  const _Delivery();
  @override
  Widget build(BuildContext context) {
    return const MyTextField(hintText: 'adress');
  }
}

class _Pickup extends StatelessWidget {
  const _Pickup();
  @override
  Widget build(BuildContext context) {
        final controller = context.watch<HomeController>();
Widget  pickupItemBuild(index) =>   InkWell(
  onTap: () => controller.togSelectPickup(index) ,
  child:   Container(
     decoration: BoxDecoration(
      color: Colors.black.withOpacity(controller.selectedIndexPickupAdress == index  ? 0.1 : 0,),
      border: controller.selectedIndexPickupAdress == index ? Border.all(color :Colors.black.withOpacity(0.5) ) : null ),
    child:   ListTile(
          title: Text(controller.listInfoRestorans[index].adres),
          leading: const Icon(Icons.location_on),
          subtitle: Row(
            children: [
               Text(controller.listInfoRestorans[index].dataTime.values.toString()),
            ],
          ),
          trailing: Text(controller.listInfoRestorans[index].status ? 'Открыт' : 'Закрыт'),
        ),
  ),
);


    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView(
        shrinkWrap: true,
        children: List.generate(
          controller.listInfoRestorans.length,
          (index) => pickupItemBuild(index) ,
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  final double size;
  const _Title({required this.title, required this.size});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: size),
          ),
        ),
      ],
    );
  }
}

class MyRadio extends StatelessWidget {
  final Opl opl;
  final String text;
  const MyRadio({super.key, required this.opl, required this.text});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    return Row(
      children: [
        Radio<Opl>(
          activeColor: Colors.black,
          value: opl,
          groupValue: controller.sposopOpl,
          onChanged: (Opl? value) => controller.setPay(value!),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 18,
              color: Colors.black
                  .withOpacity(opl == controller.sposopOpl ? 1 : 0.5)),
        ),
      ],
    );
  }
}

class _SposopPay extends StatelessWidget {
  const _SposopPay();
  final List<Opl> sposopValue = const <Opl>[Opl.nal, Opl.cart];
  final List<String> sposopText = const <String>['Наличными', 'Без наличными'];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Column(children: [
        const SizedBox(height: 18),
        ...List.generate(
            sposopValue.length,
            (index) =>
                MyRadio(opl: sposopValue[index], text: sposopText[index])),
        const SizedBox(height: 18),
      ]),
    );
  }
}
