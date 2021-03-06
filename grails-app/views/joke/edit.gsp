<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'joke.label', default: 'Joke')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-joke" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav pull-right" role="navigation">
            <ul>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-joke" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.joke}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.joke}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.joke}" method="PUT">
                <g:hiddenField name="version" value="${this.joke?.version}" />
                <fieldset class="form">

                    <f:field  bean="joke" property="text">
                        <g:textArea name="text" cols="55" rows="5" maxlength="500" style="width:450px" value="${this.joke.text}"/>
                    </f:field>
                    <f:field bean="joke" property="author">
                        <g:textField name="author" style="width:450px" value="${this.joke.author}"/>
                    </f:field>
                    <div class="fieldcontain">
                        <label> </label>
                        <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    </div>

                </fieldset>
            </g:form>
        </div>
    </body>
</html>
