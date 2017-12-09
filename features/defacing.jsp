<HTML>
<head>
<%@ include file="../header.jsp" %>
<title>CS 166 Security Blog</title>
<script>

    $(document).ready(function () {
        $('#addCommentBtn').click(function () {
        	commentTxt = $('#comment').val();
            $('<p>Comment:' + commentTxt + '</p>').appendTo('#commentDiv');
        });
    });

</script>
</head>


<body>

<h2>Website Defacing</h2>

<p>Website defacing is exposing a security vulnerability to alter a web page. Attackers may replace a web page with their own web page, or alter part of an existing one. This attack can be done in various ways including but not limited to SQL injection and cross-site scripting. We will demonstrate a relatively simple example with cross-site scripting in which we change the appearance of this page.</p>

<h3>Try it out: </h3>


<p>Below is a sample blog. Users can add comments to the blog. Try writing a comment and adding &lt;script&gt; document.body.innerHTML="&lt;style&gt;body{visibility:hidden;}&lt;/style&gt;&lt;div style=visibility:visible;&gt;&lt;h1&gt;THIS SITE WAS HACKED&lt;/h1&gt;&lt;/div&gt;"; &lt;/script&gt; somewhere in your comment. After clicking the "Add comment" button, your comment will be shown and the javascript code will be executed - replacing the entire page with a message. </p>

<h3 style="text-align:center;">Sample Blog</h3>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tincidunt lobortis pretium. Nam scelerisque, neque et bibendum vehicula, risus enim pharetra dui, quis mattis ipsum mi vitae tellus. Quisque facilisis, purus non ultrices hendrerit, elit leo imperdiet enim, vel blandit dolor nibh id orci. Morbi egestas enim ut nibh tristique, vitae lacinia est gravida. Aliquam ac pellentesque ligula, sit amet egestas dolor. Etiam venenatis vestibulum quam, sit amet interdum purus dictum nec. Vestibulum et ultricies ipsum. Praesent id egestas risus, non fringilla nulla. Praesent porttitor augue odio.

Nam sit amet elementum ante. Vivamus nibh augue, porttitor id ante in, convallis finibus ante. Integer aliquam magna eu gravida condimentum. Nullam eget sodales nibh, in bibendum dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse rutrum fringilla sodales. Vivamus lacinia nibh vitae nibh vehicula, non tincidunt dolor scelerisque. Cras a nibh nec orci tristique condimentum vel sed urna. Ut non dolor ut sem pulvinar molestie. Sed viverra, mi vel varius placerat, purus ipsum pulvinar libero, in consectetur velit mi ut ex. Proin ornare laoreet ex, at venenatis mi efficitur quis. Integer id eleifend felis. Pellentesque tempor elementum pellentesque. Praesent non odio ut erat condimentum dapibus ac in sem.

Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent accumsan lacus quam. Nulla eleifend consectetur aliquam. Aliquam iaculis tincidunt ante, nec commodo ante mollis interdum. Mauris vehicula auctor velit, vitae porta mi viverra efficitur. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam cursus lacus in turpis fermentum, non ullamcorper tellus elementum. Praesent faucibus sapien id libero varius, sit amet convallis augue pharetra. Mauris consectetur faucibus odio sit amet efficitur. Vestibulum mollis sapien sit amet malesuada auctor. Integer ultrices ultrices leo, nec rutrum mauris aliquet vitae. Duis porttitor porttitor arcu vel imperdiet. Sed placerat turpis velit. Proin sodales molestie laoreet. Quisque euismod arcu vitae sapien consequat, ac viverra tortor sollicitudin. Vivamus pharetra mauris eu enim egestas, non accumsan tellus volutpat.

Ut quis dolor est. Phasellus sem est, tempor vel enim quis, rutrum dignissim leo. Quisque in venenatis enim, ut varius est. Pellentesque id suscipit purus. Phasellus feugiat convallis lorem eu eleifend. Ut auctor, ipsum vitae vehicula lacinia, elit odio tempus dui, eu eleifend urna dui ultrices purus. Donec non mi elementum, vehicula lacus non, tincidunt neque. Morbi vitae dui nisl. Sed tempus elit iaculis erat congue blandit. Donec malesuada porttitor odio, non placerat felis bibendum eu. Cras ut suscipit ante.

Ut malesuada, velit quis bibendum elementum, purus sapien euismod tellus, ut viverra magna dolor sed ligula. Nulla facilisi. Nam pellentesque aliquam nulla, non tincidunt erat aliquam et. Morbi eu felis gravida, elementum lacus sit amet, scelerisque mauris. Praesent volutpat imperdiet ipsum, at placerat dui condimentum sed. Duis scelerisque dui rhoncus mauris dapibus, at accumsan nulla commodo. Aenean in libero eu risus sollicitudin auctor. Vivamus dictum nulla consequat commodo fringilla. Morbi condimentum mauris at diam dapibus iaculis. Vestibulum ut blandit elit, et ullamcorper mauris. Vivamus consequat et elit vel aliquam. Nulla facilisi. Donec eget elit mi.</p>

<h4 style="text-align:center;">Comments</h4>
<div id="commentDiv"></div>

<textarea class="form-control" rows="3" id="comment"></textarea>
<input type="button" id="addCommentBtn" value="Add Comment"/>

<p>In this specific example, I'm not saving any of your comments. If I saved the comments, any user who came to this page would also see the hacking message instead of the actual page.</p>



</body>

<%@ include file="../footer.jsp" %>
</HTML>