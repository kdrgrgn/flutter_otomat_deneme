
class Firma {

  int yetki;
  String firmaAdi;
  String firmaTel;
  String yetkiliAdSoyad;
  String yetkiliTel;
  String yetkiliMail;
  String firmaAdres;
  String sifre;
  String firmaID;

  Firma({this.firmaAdi, this.firmaTel, this.yetkiliAdSoyad, this.yetkiliTel,
    this.yetkiliMail, this.firmaAdres, this.sifre, this.firmaID,this.yetki});


  Map<String, dynamic> firmatoMap() {
    return {
      'firmaAdi': firmaAdi,
      'firmaAdres': firmaAdres,
      'firmaTel': firmaTel,
      'firmaID': firmaID,
      'yetkiliAdSoyad': yetkiliAdSoyad,
      'yetkiliMail': yetkiliMail,
      'yetkiliTel': yetkiliTel,
      'yetki': yetki==null?1:yetki
    };
  }

  Firma.fromMap(Map<dynamic, dynamic> map)
      : firmaAdi=map["firmaAdi"],
        firmaAdres=map["firmaAdres"],
        firmaTel=map["firmaTel"],
        firmaID=map["firmaID"],
        yetkiliAdSoyad=map["yetkiliAdSoyad"],
        yetkiliMail=map["yetkiliMail"],
        yetkiliTel=map["yetkiliTel"],
        yetki=map["yetki"];

  @override
  String toString() {
    return 'Firma{firmaAdi: $firmaAdi, firmaTel: $firmaTel, yetkiliAdSoyad: $yetkiliAdSoyad, yetkiliTel: $yetkiliTel, yetkiliMail: $yetkiliMail, firmaAdres: $firmaAdres, sifre: $sifre, firmaID: $firmaID}';
  }


}
