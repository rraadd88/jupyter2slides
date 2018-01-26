{%- extends 'slides_reveal.tpl' -%}

{% block input_group %}
 {% if cell['metadata'].get('cell_tags',{}).get('cutcode_html','') == True -%}
  <div></div>
 {% else %}
  {{ super() }}
 {% endif %}

<div class="input_hidden">
{{ super() }}
</div>
{% endblock input_group %}

{% block header %}
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="chrome=1" />

<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />

<title>{{resources['metadata']['name']}} slides</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.10/require.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

<!-- General and theme style sheets -->
<link rel="stylesheet" href="{{resources.reveal.url_prefix}}/css/reveal.css">
<link rel="stylesheet" href="css/custom.css" id="theme">

<!-- If the query includes 'print-pdf', include the PDF print sheet -->
<script>
if( window.location.search.match( /print-pdf/gi ) ) {
        var link = document.createElement( 'link' );
        link.rel = 'stylesheet';
        link.type = 'text/css';
        link.href = '{{resources.reveal.url_prefix}}/css/print/pdf.css';
        document.getElementsByTagName( 'head' )[0].appendChild( link );
}

$(document).ready(function(){
  $(".output_wrapper").click(function(){
      $(this).prev('.input_hidden').slideToggle();
  });
})
</script>

<!--[if lt IE 9]>
<script src="{{resources.reveal.url_prefix}}/lib/js/html5shiv.js"></script>
<![endif]-->

<!-- Get Font-awesome from cdn -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css">

{% for css in resources.inlining.css -%}
    <style type="text/css">
    {{ css }}
    </style>
{% endfor %}

<link rel="stylesheet" type="text/css" href="css/custom.css">

<!-- Add favicon -->
<link rel="shortcut icon" type="image/ico" href="favicon.ico" />

<!-- Additional imports for plugins -->
<link rel="stylesheet" href="plugin/title-footer/title-footer.css">

</head>
{% endblock header%}

{% block body %}

{{ super() }}

<script>
require(
    {
      // it makes sense to wait a little bit when you are loading
      // reveal from a cdn in a slow connection environment
      waitSeconds: 15
    },
    [
      "{{resources.reveal.url_prefix}}/lib/js/head.min.js",
      "{{resources.reveal.url_prefix}}/js/reveal.js"
    ],
    function(head, Reveal){
        // Full list of configuration options available here: https://github.com/hakimel/reveal.js#configuration
        Reveal.initialize({
            controls: true,
            progress: true,
            history: true,
            width: '80%',
            height: '100%',
            slideNumber: true,
            scroll: true
            // Display controls in the bottom right corner
            //controls: true,

            // Display a presentation progress bar
            progress: true,

            // Push each slide change to the browser history
            //history: false,

            // Enable keyboard shortcuts for navigation
            //keyboard: true,

            // Enable touch events for navigation
            //touch: true,

            // Enable the slide overview mode
            //overview: true,

            // Vertical centering of slides
            //center: true,

            // Loop the presentation
            //loop: false,

            // Change the presentation direction to be RTL
            //rtl: false,

            // Number of milliseconds between automatically proceeding to the
            // next slide, disabled when set to 0, this value can be overwritten
            // by using a data-autoslide attribute on your slides
            //autoSlide: 0,

            // Enable slide navigation via mouse wheel
            mouseWheel: false,

            // Transition style
            transition: 'fade', // default/concave/cube/page/concave/zoom/linear/fade/none

            // Transition speed
            //transitionSpeed: 'default', // default/fast/slow

            // Transition style for full page backgrounds
            //backgroundTransition: 'default', // default/linear/none

            // Theme
             theme: 'white' // available themes are in /css/theme
          //   theme: Reveal.getQueryHash().theme, // available themes are in /css/theme
          //   transition: Reveal.getQueryHash().transition || 'linear', // default/cube/page/concave/zoom/linear/none
          //   // Optional libraries used to extend on reveal.js
          //   dependencies: [
          //       { src: "{{resources.reveal.url_prefix}}/lib/js/classList.js",
          //         condition: function() { return !document.body.classList; } },
          //       { src: "{{resources.reveal.url_prefix}}/plugin/notes/notes.js",
          //         async: true,
          //         condition: function() { return !!document.body.classList; } },
          //       { src: 'plugin/title-footer/title-footer.js', async: true, callback: function() { title_footer.initialize(
          //         // Change footer here
          // '© 2018 Rohan Dandage.', 'rgba(255,255,255,0.5)'
          // ); } }
            ]
        });
        var update = function(event){
          if(MathJax.Hub.getAllJax(Reveal.getCurrentSlide())){
            MathJax.Hub.Rerender(Reveal.getCurrentSlide());
          }
        };
        Reveal.addEventListener('slidechanged', update);
        Reveal.addEventListener('fragmentshown', update);
        Reveal.addEventListener('fragmenthidden', update);
        var update_scroll = function(event){
          $(".reveal").scrollTop(0);
        };
        Reveal.addEventListener('slidechanged', update_scroll);
    }
);
</script>

{% endblock body %}
