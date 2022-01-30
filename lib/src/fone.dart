import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

bool temFone = false;
bool temCel = false;

ligarContato(context, int pacFone, int pacCel, bool pacZap1, bool pacZap2) {
  pacFone == 9 ? {temFone = false, pacZap1 = false} : temFone = true;
  pacCel == 9 ? {temCel = false, pacZap2 = false} : temCel = true;

  showModalBottomSheet(
    barrierColor: Colors.black.withOpacity(.7),
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 220,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Telefones',
                      style: GoogleFonts.roboto(
                        fontSize: 22,
                        letterSpacing: .2,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 110,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    temFone
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 200,
                                height: 40,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Telefone :',
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        letterSpacing: .2,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      pacFone.toString(),
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        letterSpacing: .2,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () => {
                                  ligarPaciente(
                                      'tel:${pacFone.toString()}', context)
                                },
                                child: Container(
                                  width: 45,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[700],
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                    border: Border.all(
                                      color: const Color(0xFF757575),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      FaIcon(
                                        FontAwesomeIcons.phoneAlt,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              pacZap1
                                  ? InkWell(
                                      onTap: () => {
                                        openWhats(pacFone),
                                      },
                                      child: Container(
                                        width: 45,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.green[700],
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          border: Border.all(
                                            color: const Color(0xFF757575),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            FaIcon(
                                              FontAwesomeIcons.whatsapp,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 45,
                                      height: 40,
                                      color: Colors.white,
                                    ),
                            ],
                          )
                        : const SizedBox(
                            height: 0,
                          ),
                    temFone
                        ? const SizedBox(
                            height: 20,
                          )
                        : const SizedBox(
                            height: 0,
                          ),
                    temCel
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 200,
                                height: 40,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Celular :',
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        letterSpacing: .2,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      pacCel.toString(),
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        letterSpacing: .2,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () => {
                                  ligarPaciente(
                                      'tel:${pacCel.toString()}', context)
                                },
                                child: Container(
                                  width: 45,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[700],
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                    border: Border.all(
                                      color: const Color(0xFF757575),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      FaIcon(
                                        FontAwesomeIcons.phoneAlt,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              pacZap2
                                  ? InkWell(
                                      onTap: () => {
                                        openWhats(pacCel),
                                      },
                                      child: Container(
                                        width: 45,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.green[700],
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          border: Border.all(
                                            color: const Color(0xFF757575),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            FaIcon(
                                              FontAwesomeIcons.whatsapp,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 45,
                                      height: 40,
                                      color: Colors.white,
                                    ),
                            ],
                          )
                        : const Text(''),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void openWhats(numero) async {
  var foneNumero = '+55' + numero.toString();
  var celular = 'Olá como vai';
  var url = 'https://wa.me/+$foneNumero?text=+$celular';
  await launch(url);
}

ligarPaciente(String url, BuildContext context) async {
  await canLaunch(url)
      ? await launch(url)
      : showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text('Alerta !!'),
              content: Text('Não foi possivel encontar um APP compatível.'),
            );
          });
}
