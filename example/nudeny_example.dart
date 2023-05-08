import 'package:nudeny/nudeny.dart';

void main() async {
  var nudeny = Nudeny();

  var classifyResult = await nudeny.classify([
    './Nudeny/testing/blackbuck.bmp',
    './Nudeny/testing/4f6e821141824b9ef81f82e7cf341288.jpg'
  ]);

  print(classifyResult);

  var classifyUrlResult = await nudeny.classifyUrl([
    "https://filesamples.com/samples/image/jfif/sample1.jfif",
    "https://w7.pngwing.com/pngs/895/199/png-transparent-spider-man-heroes-download-with-transparent-background-free-thumbnail.png",
    "http://digitalcommunications.wp.st-andrews.ac.uk/files/2019/04/JPEG_compression_Example.jpg"
  ]);

  print(classifyUrlResult);

  var detectResult = await nudeny.detect([
    './Nudeny/testing/blackbuck.bmp',
    './Nudeny/testing/4f6e821141824b9ef81f82e7cf341288.jpg'
  ]);

  print(detectResult);

  var detectUrlResult = await nudeny.detectUrl([
    "https://filesamples.com/samples/image/jfif/sample1.jfif",
    "https://w7.pngwing.com/pngs/895/199/png-transparent-spider-man-heroes-download-with-transparent-background-free-thumbnail.png",
    "http://digitalcommunications.wp.st-andrews.ac.uk/files/2019/04/JPEG_compression_Example.jpg"
  ]);

  print(detectUrlResult);

  var censorResult = await nudeny.censor([
    './Nudeny/testing/blackbuck.bmp',
    './Nudeny/testing/4f6e821141824b9ef81f82e7cf341288.jpg'
  ]);

  print(censorResult);

  var censorUrlResult = await nudeny.censorUrl([
    "https://filesamples.com/samples/image/jfif/sample1.jfif",
    "https://w7.pngwing.com/pngs/895/199/png-transparent-spider-man-heroes-download-with-transparent-background-free-thumbnail.png",
    "http://digitalcommunications.wp.st-andrews.ac.uk/files/2019/04/JPEG_compression_Example.jpg"
  ]);

  print(censorUrlResult);
}
