<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>

            <head>
                <style type="text/css">
                    .card {
                    margin: 10px 10px;
                    }

                    /* Flip Cards CSS */
                    .card-container {
                    display: grid;
                    perspective: 700px;
                    }

                    .card-flip {
                    display: grid;
                    grid-template: 1fr / 1fr;
                    grid-template-areas: "frontAndBack";
                    transform-style: preserve-3d;
                    transition: all 0.7s ease;
                    }

                    .card-flip div {
                    backface-visibility: hidden;
                    transform-style: preserve-3d;
                    }

                    .front {
                    grid-area: frontAndBack;
                    }

                    .back {
                    grid-area: frontAndBack;
                    transform: rotateY(-180deg);
                    }

                    .card-container:hover .card-flip {
                    transform: rotateY(180deg);
                    position: fixed;
                    }
                    *{
                    margin: 0;
                    padding: 0;
                    text-decoration: none;
                    font-family: "montserrat";
                    }
                    body{
                    background: #333;
                    }
                    .middle{
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%,-50%);
                    }
                    .card{
                    cursor: pointer;
                    width: 250px !important;
                    height: 420px !important;
                    }
                    .front,.back{
                    width: 100%;
                    height: 100%;
                    overflow: hidden;
                    backface-visibility: hidden;
                    position: absolute;
                    transition: transform .6s linear;
                    }
                    .front img{
                    height: 100%;
                    }
                    .front{
                    transform: perspective(600px) rotateY(0deg);
                    }
                    .back{
                    background: #f1f1f1;
                    transform: perspective(600px) rotateY(180deg);
                    }
                    .back-content{
                    color: #2c3e50;
                    text-align: center;
                    width: 100%;
                    }
                    .sm{
                    margin: 20px 0;
                    }
                    .sm a{
                    display: inline-flex;
                    width: 40px;
                    height: 40px;
                    justify-content: center;
                    align-items: center;
                    color: #2c3e50;
                    font-size: 18px;
                    transition: 0.4s;
                    border-radius: 50%
                    }
                    .sm a:hover{
                    background: #2c3e50;
                    color: white;
                    }
                    .card:hover > .front{
                    transform: perspective(600px) rotateY(-180deg);
                    }
                    .card:hover > .back{
                    transform: perspective(600px) rotateY(0deg);
                    }
                    .card-title {
                    color: goldenrod;
                    font-weight: bold;
                    position: absolute;
                    top: 80%;
                    left: 50%;
                    transform: translate(-50%,-80%);
                    }
                    .card-text{
                    margin-bottom: 0;
                    font-size: xx-large;
                    font-family: Trade Winds;
                    color: goldenrod;
                    font-weight: bold;
                    position: absolute;
                    top: 250px;
                    left: 150px;
                    transform: translate(-50%,-50%);
                    }
                    .player-name{
                    color: goldenrod;
                    font-weight: bold;
                    }
                    body, html {
                    height: 100%;
                    margin: 0;
                    font-family: Arial, Helvetica, sans-serif;
                    }

                    .hero-image {
                    background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("https://i.pinimg.com/originals/f7/4e/35/f74e354d766a9576ffbf6e3d33c92385.jpg");
                    height: 75%;
                    background-position: center;
                    background-repeat: no-repeat;
                    background-size: cover;
                    position: relative;
                    }

                    .hero-text {
                    text-align: center;
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    color: white;
                    }

                    .hero-text button {
                    border: none;
                    outline: 0;
                    display: inline-block;
                    padding: 10px 25px;
                    color: black;
                    background-color: #ddd;
                    text-align: center;
                    cursor: pointer;
                    }

                    .hero-text button:hover {
                    background-color: #555;
                    color: white;
                    }
                </style>
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"/>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
                <link href="https://fonts.googleapis.com/css?family=Trade+Winds" rel="stylesheet" />
            </head>

            <body>
                <div class="hero-image">
                    <div class="hero-text">
                        <h1 style="font-size:70px">FIFA TOP 5 <br/>PLAYERS</h1>
                        <p>By CHBAB KHALID</p>
                        <a href="https://www.easports.com/fifa/fifa-17-player-ratings-top-50#3to1" target="_blank">
                            <button>Ranking</button></a>
                    </div>
                </div>
                <br/><br/><br/>
                        <div class="container">
                            <div class="row">
                                <xsl:for-each select="Players/Player">
                                <xsl:sort select="rank"/>
                                <!-- Card -->
                                <div class="col-md-4 card-container">
                                    <div class="card-flip">
                                        <!-- Card Front -->
                                        <div class="card front card-inverse">
                                            <img class="card-img img-fluid">
                                                <xsl:attribute name="src">
                                                    <xsl:value-of select="picture"/>
                                                </xsl:attribute></img>
                                            <div class="card-img-overlay">
                                                <h4 class="card-title">Rank : <xsl:value-of select="rank"/></h4>
                                                <p class="card-text"><xsl:value-of select="Name"/></p>
                                            </div>
                                        </div>
                                        <!-- End Card Front -->
                                        <!-- Card  Back -->
                                        <div class="card back">
                                            <div class="back-content middle">
                                                <h2 class="player-name"><xsl:value-of select="Name"/></h2>
                                                <h4><xsl:value-of select="Team"/></h4>
                                                <h5>Age : <xsl:value-of select="Age"/></h5>
                                                <h5>League : <xsl:value-of select="League"/></h5>
                                                <div class="sm">
                                                <xsl:element name="a">
                                                    <xsl:attribute name="href">
                                                        <xsl:value-of select="stats"/>
                                                    </xsl:attribute>
                                                    <i class="fas fa-futbol"></i>
                                                </xsl:element>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Card Back -->
                                    </div>
                                </div>
                                <!-- End Card -->
                                </xsl:for-each>
                            </div>
                        </div>
            </body>
        </html>

    </xsl:template>

</xsl:stylesheet>