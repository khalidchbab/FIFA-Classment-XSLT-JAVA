package com.khalid.NoSQL;

import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;

public class Main {

    public static void main(String[] args) {
        Source xml = new StreamSource(new File("src/com/khalid/NoSQL/players.xml"));
        Source xslt = new StreamSource("src/com/khalid/NoSQL/players.xsl");

        convertXMLToHTML(xml, xslt);

    }
    public static void convertXMLToHTML(Source xml, Source xslt) {
        StringWriter sw = new StringWriter();

        try {

            FileWriter fw = new FileWriter("src/com/khalid/NoSQL/players.html");
            TransformerFactory tFactory = TransformerFactory.newInstance();
            Transformer trasform = tFactory.newTransformer(xslt);
            trasform.transform(xml, new StreamResult(sw));
            fw.write(sw.toString());
            fw.close();

            System.out
                    .println("players.html generated successfully");

        } catch (IOException | TransformerConfigurationException e) {
            e.printStackTrace();
        } catch (TransformerFactoryConfigurationError e) {
            e.printStackTrace();
        } catch (TransformerException e) {
            e.printStackTrace();
        }


    }

}
