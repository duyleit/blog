{% if posts|length %}
    <div class="posts">
        {% for post in posts %}
            {% set postLink = post.getType() ~ '/' ~ post.getId() ~ '/' ~ post.getSlug() %}
            {% if post.getThumbnail() is not empty %}
                {#% set imgUrl = getUrlThumbnail(post.getThumbnail()) %#}
                {% set imgUrl = post.getThumbnail() %}
            {% else %}
                {% set imgUrl = assets('images/blog.jpg') %}
            {% endif %}
            <article class="preview-post post">
                <div class="hero-container">
                    <a class="hero_url" href="/{{ postLink }}">
                        <img class="hero" style ="background: linear-gradient(
                      rgba(37, 43, 51, 0.35),
                      rgba(37, 43, 51, 0.35)
                    ), url('{{imgUrl}}'); height:350px; background-size: cover;">
                    </a>
                </div>
                <div class="media-padded">
                    <div class="meta-info">
                        {#% if post.tag contains 'podcasts' %}
                            <div class="podcast-container">
                                <i class="blog-icon podcast"></i>
                            </div>
                        {% endif %#}
                        <h1 class="h3">
                            {{ link_to(postLink, post.getTitle() ,'class' : 'title')}}
                        </h1>
                        <p class="post-info">
                            {{ post.getHumanCreatedAt() }} • By {{ post.user.getInforUser()}}
                        </p>
                    </div>
                    <div class="clearfix"></div>

                    <div class="entry excerpt">
                        {% if post.getExcerpt() is not empty %}
                            {{ this.markdown.text(post.getExcerpt()|e)}}
                        {% else %}
                            {{ this.markdown.text(post.getContent()|e) | truncate(300)}}
                        {% endif %}
                    </div>

                    <a href="/{{ postLink }}" class="read-more">
                        Read more <i class="blog-icon read-more"></i>
                    </a>
                </div>
            </article>
        {% endfor %}
    </div>
{% else %}
<div class="container">
    <div class="alert alert-info">There are no posts here</div>
</div>
{% endif %}
