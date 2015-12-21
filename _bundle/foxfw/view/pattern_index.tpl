{% extends getView('pattern_pattern') %}


{% block title %}FoxFW Titre{% endblock %}


{% block metaDesc %}
	Description du site
{% endblock %}


{% block metaKey %}tag site{% endblock %}


{% block favicon %}{{ path('web/img/design/favicon.png') }}{% endblock %}


{% block head %}
	<link rel="stylesheet" media="screen and (min-width: 1100px)" href="{{ bundlePath('foxfw#design.css') }}" />
	<link rel="stylesheet" media="screen and (min-width: 1100px)" href="{{ bundlePath('foxfw#panel.css') }}" />
	<script type="text/javascript" src="{{ bundlePath('foxfw#js.js') }}"></script>

	<link rel="stylesheet" media="screen and (max-width: 1099px)" href="{{ bundlePath('foxfw#mobile_default.css') }}" />
	<link rel="stylesheet" media="screen and (max-width: 1099px)" href="{{ bundlePath('foxfw#mobile.css') }}" />
	
	<link rel="stylesheet" href="{{ bundlePath('foxfw#body.css') }}"/>

	<!--
	//Facebook 
	<meta property="og:image" content="">
	<meta property="og:image:type" content="image/png">
	<meta property="og:image:width" content="447">
	<meta property="og:image:height" content="200">-->

	<!-- Header supplémentaire -->
	{% block head_base %}{% endblock %}
{% endblock %}



{% block header %}
	{% include getView('pattern_header') %}
{% endblock %}



{% block menu %}
	{% include getView('pattern_menu') %}
	{% include getView('pattern_menu_mobile') %}
{% endblock %}



{% block container_body %}
	<div id="body" class="container-fluid" >
		{% if User.isRole('ADMIN') == true %}
			{{ viewPanelAdmin() }}
		{% endif %}
		
		{% block container %}
		{% endblock %}
	</div>
{% endblock %}



{% block footer %}
		{% include getView('pattern_footer') %}
{% endblock %}