<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'joke.label', default: 'Joke')}"/>
    <title>Prepiad Humor</title>
</head>

<body>
<a href="#list-joke" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav pull-right" role="navigation">
    <ul>
    <g:if test="${session.user}">
        <li><g:link action="create"><i class="fa fa-comment" aria-hidden="true"></i> <g:message code="default.new.label" args="[entityName]"/></g:link></li>
        <li><a href="/user"> <i class="fa fa-users" aria-hidden="true"></i> Users</a></li>
        <li><a href="/user/logout"> <i class="fa fa-sign-out" aria-hidden="true"></i> Sign Out</a></li>
    </g:if>
    <g:else>
        <li><a href="/user/login"> <i class="fa fa-user" aria-hidden="true"></i> Sign In</a></li>
    </g:else>
    </ul>
</div>

<div class="container">
    <g:each in="${jokeList}" var="joke">
    <div class="row padding-top-large">
        <div class="col-md-2"></div>

        <div class="col-md-8">
            <p class="padding-bottom-large">
                <a name="joke${joke.id}"></a>
                ${joke.text.replace('\n','<br/>').encodeAsRaw()}
                <br/><br/>
                <a href="/joke/thumbsUp/${joke.id}" class="btn btn-default pull-right">
                    <i class="fa fa-thumbs-o-up margin-right-small" aria-hidden="true"></i> Like
                    <span class="badge margin-left-small" style="background-color: #6f5499;opacity: .8;">
                    ${joke.likes}
                    </span>
                </a>
                <i>- ${joke.author}</i>

        <g:if test="${session.user}">
            <g:form resource="${joke}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${joke}"> <g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </g:if>
            </p>
            <hr/>
        </div>
    </div>
    </g:each>
</div>

</body>
</html>