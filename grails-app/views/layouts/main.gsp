<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>
    <link href='http://fonts.googleapis.com/css?family=Lato:400,900' rel='stylesheet' type='text/css'>
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

    <g:layoutHead/>
</head>

<body>
<div class="jumbotron">
    <div class="container">

        <div class="page-header">
            <div class="media">
                <a class="pull-left" href="/">
                    <asset:image src="card.png" width="100px"/>
                </a>

                <div class="media-body padding-top-sm padding-left-large">
                    <h1 class="media-heading">Prepaid Humor</h1>

                    <p>
                        "Start every day off with a smile and get it over with."
                        <small>- W. C. Fields</small>
                    </p>
                </div>
            </div>

        </div>
    </div>
</div>




<g:layoutBody/>

<footer>
    <div class="container">
        © 2014 Code Liar Productions
        <br>
        Image courtesy of <a href="http://thenounproject.com/term/credit-card/31398/">The Noun Project </a>
    </div>
</footer>


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>


<asset:javascript src="application.js"/>

</body>
</html>
