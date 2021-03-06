<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'joke.label', default: 'Joke')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-joke" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav pull-right" role="navigation">
            <ul>
                <li><g:link action="create"><i class="fa fa-comment" aria-hidden="true"></i> <g:message code="default.new.label" args="[entityName]"/></g:link></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-joke" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="row padding-top-large">
                <div class="col-md-2"></div>

                <div class="col-md-8">
                    <p class="padding-bottom-large">
                        ${this.joke.text.replace('\n','<br/>').encodeAsRaw()}
                        <br/><br/>
                        <i>- ${this.joke.author}</i>

                        <g:form resource="${this.joke}" method="DELETE">
                            <fieldset class="buttons">
                                <g:link class="edit" action="edit" resource="${this.joke}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                            </fieldset>
                        </g:form>
                    </p>
                    <hr/>
                </div>
            </div>

        </div>
    </body>
</html>
