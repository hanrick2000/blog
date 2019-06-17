#### Problem
In my project, we run some queries in Solr server, and return combined response back to client. But some text fields are too large, we would like to reduce their size.

#### Use GZIPOutputStream or ZipOutputStream?
To compress data, Java provides two streams GZIPOutputStream and ZipOutputStream. What's the difference and which we should use?
The compression algorithm and performance is almost same (Lempel-Ziv Welch), the difference is that GZIP format is used to compress a single file, and ZIP is a archive format: to compress many files in a single archive: using putNextEntry and closeEntry to add a new entry into the archive file.

In this case, we use GZIPOutputStream, because we don't add and compress multiple file in a single archive, so no need to use ZipOutputStream, also the code to use ZipOutputStream si a little simpler.

Use GZIPOutputStream and Base64 Encoder to Compress String
At server side, we can use GZIPOutputStream to compress a string to a byte array stored in ByteArrayOutputStream. But we can't transfer the byte array as text in http response. We have to use a Base64 encoder to encode the byte array as Base64. We can use org.apache.commons.codec.binary.Base64.encodeBase64String(). Then we add the compressed text as a field in Solr Document field - not shown in the code below.

``` {.java .numberLines .lineAnchors}
/**
   * At server side, use ZipOutputStream to zip text to byte array, then convert
   * byte array to base64 string, so it can be trasnfered via http request.
   */
  public static String compressString(String srcTxt)
      throws IOException {
    ByteArrayOutputStream rstBao = new ByteArrayOutputStream();
    GZIPOutputStream zos = new GZIPOutputStream(rstBao);
    zos.write(srcTxt.getBytes());
    IOUtils.closeQuietly(zos);

    byte[] bytes = rstBao.toByteArray();
    // In my solr project, I use org.apache.solr.co mmon.util.Base64.
    // return = org.apache.solr.common.util.Base64.byteArrayToBase64(bytes, 0,
    // bytes.length);
    return Base64.encodeBase64String(bytes);
  }
```

#### Test Data:
Original text in memory is about 134,479,520(134mb), its zipped byte array is about 9,001,240(9mb), base 64 string is 16,198,528(16mb).
We can see that the size reduces 88%. This is huge and it's worth.
Use Base64 Decoder and GZIPInputStream to Uncompress String
At remote client side, we first read the text response from stream, about how to read one Solr document using stream API, please read:
Solr: Use STAX Parser to Read XML Response to Reduce Memory Usage
Solr: Use SAX Parser to Read XML Response to Reduce Memory Usage
Solr: Use JSON(GSon) Streaming to Reduce Memory Usage

Then use org.apache.commons.codec.binary.Base64.decodeBase64() to decode the Base64 string to byte array, and then use ZipInputStream to read the zipped byte array to get original unzipped string, then add it to Solr Document as a field.
``` {.java .numberLines .lineAnchors}
/**
   * When client receives the zipped base64 string, it first decode base64
   * String to byte array, then use ZipInputStream to revert the byte array to a
   * string.
   */
  public static String uncompressString(String zippedBase64Str)
      throws IOException {
    String result = null;

    // In my solr project, I use org.apache.solr.common.util.Base64.
    // byte[] bytes =
    // org.apache.solr.common.util.Base64.base64ToByteArray(zippedBase64Str);
    byte[] bytes = Base64.decodeBase64(zippedBase64Str);
    GZIPInputStream zi = null;
    try {
      zi = new GZIPInputStream(new ByteArrayInputStream(bytes));
      result = IOUtils.toString(zi);
    } finally {
      IOUtils.closeQuietly(zi);
    }
    return result;
  }
```

#### Test Code
``` {.java .numberLines .lineAnchors}
public static void main(String... args) throws IOException {
    String source = "-original-file-path;
    String zippedFile = "-base-64-zip-file-path-";
    FileInputStream fis = new FileInputStream(source);
    String srcTxt = IOUtils.toString(fis, "UTF-8");
    IOUtils.closeQuietly(fis);

    String str = compressString(srcTxt);
    FileWriter fw = new FileWriter(zippedFile);
    IOUtils.write(str, fw);
    IOUtils.closeQuietly(fw);

    fis = new FileInputStream(zippedFile);
    String zippedBase64Str = IOUtils.toString(fis, "UTF-8");
    IOUtils.closeQuietly(fis);

    String originalStr = uncompressString(zippedBase64Str);
    fw = new FileWriter("-revertedt-file-path");
    IOUtils.write(originalStr, fw);
    IOUtils.closeQuietly(fw);
  }
```

#### Resource
- [Solr: Use STAX Parser to Read XML Response to Reduce Memory Usage](http://lifelongprogrammer.blogspot.com/2013/10/solr-use-stax-parser-to-reduce-memory-usage.html){target="blank"}
- [Solr: Use SAX Parser to Read XML Response to Reduce Memory Usage](http://lifelongprogrammer.blogspot.com/2013/10/solr-use-sax-parser-to-reduce-memory-usage.html){target="blank"}
- [Solr: Use JSON(GSon) Streaming to Reduce Memory Usage](http://lifelongprogrammer.blogspot.com/2013/10/use-json-streaming-to-reduce-memory.html){target="blank"}
- [Tips and pitfalls when using Java’s ZipOutputStream](http://blog.bradleywagner.org/2013/08/tips-and-pitfalls-when-using-javas-zipoutputstream/){target="blank"}
- [GZIPOutputStream vs ZipOutputStream](http://www.jguru.com/forums/view.jsp?EID=222379){target="blank"}
