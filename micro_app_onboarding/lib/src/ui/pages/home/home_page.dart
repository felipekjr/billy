import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:micro_commons_design_system/micro_commons_design_system.dart';
import 'package:micro_core/micro_core_utils.dart';

class SlideItem {
  final int index;
  final String path;
  final String description;

  const SlideItem(this.index, this.path, this.description);
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int slideIndex = 0;
  List<SlideItem> slides = [
    const SlideItem(
      0,
      'assets/onboarding1.png', 
      'Controle seus gastos e contas a pagar de forma fácil'
    ),
    const SlideItem(
      1,
      'assets/onboarding2.png', 
      'Receba lembretes e nunca mais atrase suas contas'
    )
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Spacing.x5,
              horizontal:Spacing.x3
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Logo(),
                const SizedBox(height: Spacing.x7),
                Column(
                  children: [
                    carouselSlide(),
                    const SizedBox(height: Spacing.x3),
                    indicators(),
                  ],
                ),
                const SizedBox(height: Spacing.x7),                
                buttons()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget carouselSlide() => CarouselSlider(
    options: CarouselOptions(
      height: 270.0,
      viewportFraction: 1.0,
      autoPlay: true,
       onPageChanged: (index, reason) {
        setState(() => slideIndex = index);
      }
    ),
    items: slides.map((slide) => Builder(
      builder: (BuildContext context) {
        return Column(
          children: [
            Image.asset(
              slide.path, 
              package: 'micro_app_onboarding',
              height: 200,
            ),
            const SizedBox(height: Spacing.x4),
            Center(child: Text(
              slide.description,
              style: TextStyles.normalThin(),
              textAlign: TextAlign.center,
            ))
          ]
        );
      },
    )).toList(),
  );

  Widget indicators() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: slides.map((e) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: slideIndex == e.index ? 
            ColorsPalette.green : 
            ColorsPalette.currentLine,
          shape: BoxShape.circle
        ),
      ),
    )).toList(),
  );

  Widget buttons() => Column(children: [
    PrimaryButton(title: 'Cadastre-se', onTap: (){
      Navigator.pushNamed(context, '/onboarding/register');
    }),
    const SizedBox(height: Spacing.x2Half),
    SecondaryButton(title: 'Login', onTap: () {
      Navigator.pushNamed(context, '/onboarding/login');
    })
  ]);
}