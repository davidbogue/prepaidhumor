<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title>Sign In</title>
</head>
<body>
<div class="nav pull-right" role="navigation">
    <ul>
        <li><a href="${createLink(uri: '/')}"> <i class="fa fa-arrow-circle-left" aria-hidden="true"></i> Back</a></li>
    </ul>
</div>
<div id="create-user" class="content scaffold-create" role="main">
    <h1>Sign In</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.loginCmd}">
        <ul class="errors" role="alert">
            The username or password is incorrect.  Please try again.
        </ul>
    </g:hasErrors>
    <g:form name="loginForm" url="[controller:'user',action:'login']" >
        <fieldset class="form">
            <div class="fieldcontain">
                <label>Email: </label>
                <g:textField name="email" value="${fieldValue(bean:loginCmd, field:'email')}"/>
            </div>
            <div class="fieldcontain">
                <label>Password: </label>
                <g:passwordField name="password"/>
            </div>
            <div class="fieldcontain">
                <label> </label>
                <g:submitButton name="login"  value="Sign In" />
            </div>
        </fieldset>
    </g:form>
</div>
</body>
</html>
