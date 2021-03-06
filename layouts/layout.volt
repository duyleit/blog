<!DOCTYPE html>
<html lang="en" class="app">
    <head>
    {% set controller = this.view.getControllerName(), action =  this.view.getActionName()%}
    {% set name = this.config.application.name, publicUrl = this.config.application.publicUrl %}
    <!-- Add meta tags to refactor-->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, target-densitydpi=160dpi, initial-scale=1.0" />
    <meta name="description" content="">
    <meta name="keywords" content="{{name}}, Phanbook, Phalcon,QA">
    <meta name="author" content="Phanbook Team">
    <meta property="og:title" content="{{ name }}">
    <meta property="og:type"  content="website">
    <meta property="og:image" content=" {{ name }}">
    <meta property="og:url" content="{{publicUrl}}">
    <link rel="shortcut icon" href="{{ getImageSrc('favicon.png') }}">
    <title>{% block title%}{% endblock %} - {{name}}</title>

    {%- if canonical is defined -%}
        <link rel="canonical" href="{{ publicUrl}}/{{ canonical }}"/>
        <meta property="og:url" content="{{ publicUrl }}/{{ canonical }}">
        <meta property="og:site_name" content="{{name}}">
    {%- endif -%}

    {%- if userPosts is defined -%}
        <link rel="author" href="{{publicUrl}}/@{{userPosts.getInforUser()}}">
        <link rel="publisher" href="{{ publicUrl }}">
    {%- endif -%}
    <link rel="stylesheet" type="text/css" href="{{assets('css/app.css')}}" />

    <script type="text/javascript">
        var baseUri     = '{{ this.config.application.baseUri }}';
        var controller  = '{{ controller }}';
        var action      = '{{ action }}';
        var googleAnalytic = '{{ this.config.googleAnalytic }}';
    </script>
    </head>
    <body>
        <div class="container">
            {{ partial('partials/header')}}
            <div id="main" role="main">
                {% block content%}{% endblock %}
            </div>
            {{ partial('partials/pagination')}}

            {{ partial('partials/footer')}}
        </div>
        <script src="{{assets('js/app.js')}}"></script>
        {{ this.assets.outputJs() }}
        {% block scripts%}{% endblock %}
    </body>
</html>
