{% extends getView('pattern_index') %}

{% block title %}{{ parent() }}{% endblock %}

{% block container %}
<div class="row">
	<div id="calendrier" class="container hidden-xs hidden-sm visible-md visible-lg">
		{{ controller("Controller_calendrier#viewCalendrier") }}
	</div>

	<div class="container" >
		{{ controller("Controller_carousel#view") }}
	</div>

	<div id="article" class="container">
		{% include getView('pages_article_graph') %}
	</div>
</div>
{% endblock %}